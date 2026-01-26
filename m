Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8420E31C
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 04:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769403231; cv=fail; b=LamtX1SR0wfeub8TcHU4h9YM6IIDnLNFxMa9gEvK1vm9VFXnS8ojvOC88aARR/dKX87lTh9Wfi956nFG8kgnktRLZypLBMfN+MRMhHHqRNNisexcND1zzQOioEJyUai+mApyfgXU1KKkJUdOBROse4uQDENcA5+OGvsUeoNAtwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769403231; c=relaxed/simple;
	bh=6j9MJwLvfcT2/YzXUGeo+NLgyR4rlgOrdmbGPYg3cTQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pu0LlAn9fxlYO2W5eBAK9oOIRCcLfbySY7S/KudvxT2JH21J6JyhI0KuTVIcdJkVAPeiT+1jCHofYeiMdhzgxp1IVAGTTuoBDgMsYusOScSARz5ExuRx2QlFiaZ3Ahin797KJScSJ66sgAdstSmc3s/sCv9L167gFwaSVJzTltI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l+SMu99r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lnh0QGB4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l+SMu99r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lnh0QGB4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q23qB9247091
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 04:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=t+al2LP+iax7OqHbnFnrpauwzWf2t8SAZJS4hrrL3N4=; b=
	l+SMu99r4BbkR9eVfO0v6WiXJqEZPv11MSW6sdcnCpzYstvBmC4KIuWJY5VkRhyv
	EC3HvBeZ/cTYJfyfa+CW3ZqmHqcc5fXqRwsyn4VThjtJOqG4kpDd+aYT/cdIkXa8
	nAxl5UwI9ntPS8FHQQ5Qpdr0hpayyPvuyTVbWAGR55rVwkmpdH4YZEiUWc0By7kr
	PZGeeIy0MFbAnaGgzSPJoHj1UHf8IP4a9MzbvkkRmXi5G+SwIakBqiftbVlc9Qmq
	jZ8LkorKgkaACYPUUW2FjM/SFXC4Vee+kjTku6y590CEp033iVIgD0yEjWv4jGsf
	Mtj39/rcOTvIXjvNT2LYNA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvn09hdhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 04:53:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60Q1ItjX020034
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 04:53:46 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhcuh77-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 04:53:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhj7oI5EJwG3f9Y4Cm2gkkkmH3QWAss6YlbW6AiVAMTMVfgz6LiDItBMTFseCIxTnZkJLWtdTUEwwQfbi0/xBbiMknWvauAGOYTwBFSqMA3YH4TjHZ4RB8ilrRhfTNPc9tPAh2jkxFOC5wRGl2tinQVFKCMp8FlFw74cA1Mr9dJeYCMMvVIBFtVS1jn6IRv9zSLU32fl2GK9/p2aS2TV8PNZAm8ykVtCDzxkNnVDQ0rAeqBDWiOVKR/aGWEt50YD3KlyQO+KEmdp6Dobu3mfFUYhdvGHTom1+VRGm4b913z2k8W6zqD3aJSw6Vi7yq2RvzRSjoDcsx+xVJxVRHzepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+al2LP+iax7OqHbnFnrpauwzWf2t8SAZJS4hrrL3N4=;
 b=ysJZ+qs0U1e5OKR80IgHz9jSWFMf41KFwVYf2ANg02CRWDwBK3WO9ZF4mNBfoPbV7K6H7bzvzw7z6sf/NTBQIg+qdahFFNyCpGL6KEiFZY93pvjsYKTu/rHYJwHB6t0Nu4BYjGZv7CuhCu/rPWX26mQa4pWY6hRbW5VLRfZFWL4HQXRrQvnmsFjpsoKSJ76VVZrIsFeKjLXle4TkaUJayEPZGrcLCnlhw1lTs0bX/I7HIuhHbX0gXInQ4/vshs0dldnlgoviSgmQivh5VPxYMDzgmflFjq2fgJdoBeUYQjbMKN3n4bctUodRYFRFm5AWPLVUIOFdAHjidnCn+0oC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+al2LP+iax7OqHbnFnrpauwzWf2t8SAZJS4hrrL3N4=;
 b=Lnh0QGB4/IJfXSzNCGEv6/xc3PKWzguKTf/Ondc6d6D0p3X0JcsctivDnp8XbqRPtqstVbsXzO0C5AgaLfB510ycbhKYwQV6GmUtjY+sQb1bh7Yh8tSvlSpohr2wO4zSNErdLiCBhKMN0wkMHzkigwtDNvTkQsi4vAr0s8wyZLw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7324.namprd10.prod.outlook.com (2603:10b6:8:ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 04:53:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 04:53:40 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Update LLM context files to forbid "if" statements
Date: Sun, 25 Jan 2026 23:53:41 -0500
Message-Id: <20260126045341.7172-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:510:33d::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f12f34d-834a-4dd5-e3e5-08de5c96dfc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3QFzgzq/IZqlGVYOFDpq7RQni7wJZOGpk3/PY7MFBFmxMy1OLCsnJYH7bQSs?=
 =?us-ascii?Q?+LNMQuigeg0+Z8xkQJ07n8uJvy0raaOUWDIGGV0W5F4QCWipwHcmsL4m+K0X?=
 =?us-ascii?Q?wlwhnzkDXtVAMCqjzb+LD4abGNRel1sLMyVww19ZQdr+pUWTyhbFhYP1WtZP?=
 =?us-ascii?Q?GVm+8vaeSK/r3tVa4lil7fh1LVk6JCApY1p6dzCagPoZDn0oUUwb1it8burz?=
 =?us-ascii?Q?YxRP31jKdQCvEBCLivGHw1ZR/DDTcN4URH/T0z/GCcDHqZdMgCYguTLTtRXO?=
 =?us-ascii?Q?5KU9RJatqwXavfwA7XBEH06trT2OGcnlbx0zHnxMRichTalPYmuO+siB9dgK?=
 =?us-ascii?Q?w2RXbZmVmKPHalQ+s1EdmQJwUT8ZJk9IWte3pM6VoWsOZFhkllUaHAm5boV1?=
 =?us-ascii?Q?r3gDuAPfUnRXb50oWxXIpo9ueLCrVfifnAF5jdCmLMFvAmwJr5pJH9MZtfPJ?=
 =?us-ascii?Q?OmpEbfWV8izjqlziE5HUYBOydFXvxGcPwzdS/F04whhWSwHRl6LfgT2CAXLd?=
 =?us-ascii?Q?YxDXWITRKpeDdk2tHhdBy9HHBnrG6HiRWW7vsm2xoeb5ibE86xIS7QCHtT67?=
 =?us-ascii?Q?znBCG1trdVvqODme+5qJjXv/30A4a1l88W0u0W/T3RY5ieVBXEYfTg/9l1TN?=
 =?us-ascii?Q?8zpyo2ZCsKC7enTNCufUJnehgeyjCPG4OkSa/kpU5EPuVQewZMi0KP8xmx2U?=
 =?us-ascii?Q?8QTuTnPiZ5We6WPZ0YUm4G8LK0+ULHO6VBPKVZW08YzaAXHBgX23hdQ7adnz?=
 =?us-ascii?Q?4FyQyPtM04/jsIHzQiUA/Ay1fHh+kU4dXjwtdQkaW9XHrPtaaQunO2Vj5jbq?=
 =?us-ascii?Q?rYIUZUeQ9gf5kZg6mp6ychUNORjqlFR3lZeepkeYQJtnjLx3oy/F87hNYr7b?=
 =?us-ascii?Q?wlVbpguOI/e0dfVALHxPT2la9z+fiYa9zAk/gwKCPEbsk3k/MKw8TkPWIUre?=
 =?us-ascii?Q?STOAVhjFoU+43mOuCkBjUZr11+Qi0bQY3V9xZ586tViZM9gu/gF0VJVZXC0M?=
 =?us-ascii?Q?BQwP8uMTnObtk1otH12AfHIx3cIC39vDYARG9VQmYRdSWCQZsywA7WYcV46V?=
 =?us-ascii?Q?O4bD++Omu4mu8SR6y1eAF3NvAGyz9ebrSvRmrJedV6UWVkRIXNvNqHZG7UZp?=
 =?us-ascii?Q?Pd2XGOnBAN4lS2gCfaeaNbgU7p+74BTiQuBRXwzUQMf/4SPPrkbQSb+yuqz1?=
 =?us-ascii?Q?pV/AiSTTAmJmfMUJU4rxbSZGQKlGkdHusjJDaC9/QOrNXalRPbdWnYYa4dsE?=
 =?us-ascii?Q?ImAQcGMdEXT+FDvBzwscbNzMQASwtqwHUiuZwGSFAce9L7Ld13hs8C1Pgc1Z?=
 =?us-ascii?Q?YqTAohBo0cGjlIyEb6DmNIyPka2DU1NkybZe936wRdZo0kz6KsJgHenjNjF9?=
 =?us-ascii?Q?py1pgwslAZnH6lVnvdJgorg8IdXsgpRssR0BMaGShWAkZv3JpBuvdPiNRAV1?=
 =?us-ascii?Q?n/oiSddy1LbpDSqddCNhkvmyO4ydwtnA4eWh+W1tOFtBjBFNIZY7MtE9r6eD?=
 =?us-ascii?Q?QziWUWSg544G8y6lTwoGFuYjnofpBLPQjVwpViG5watwt4nDdS2QgF40QPn8?=
 =?us-ascii?Q?MZUv8N25R5eRRbzBgww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q0ZdMa1pleoh7wsV8XehjMFYPFkYfQyyXVQ4RNHzMZMNxGUrjztl05U8QeL9?=
 =?us-ascii?Q?lsaz12wmRMQsH7dj9MvYLcCXE41mvMEYQyjBb2xkKYfH3h5CBVHlZCtp8e7C?=
 =?us-ascii?Q?Mg/JoBSwpOacC1DEMA9MDhQNIqQkRxWmieBrY7cz2cfhc+e5g99uXcqtljYG?=
 =?us-ascii?Q?DP+4auVMS5ZsiQs6lLDcwx+yM3KiwiRAHYS91zVLNczpY3RqX/JyO2aa9lDI?=
 =?us-ascii?Q?HOd84V6IgNmnPKr2zSU7hQOaqnu8YJ1XR1r3NEckLcDkIBtyk1XlPX+9MZB9?=
 =?us-ascii?Q?VyKfO//vuTzdY2KRyqcOfnWcXSMVVy2M1MpCXTX7+5p6V4HLTakpf6ZibKYr?=
 =?us-ascii?Q?LBnbS2AfzywReKYZB2X3busYG7R8X55PWXaR29lPLDQZqXNd0wGgEQhZ1YfM?=
 =?us-ascii?Q?6Yrxy393gFmlxvD+eQWiOP9D7eBckYPTi7gRmok6Ji0AF0VeXqmhUlhdIG7q?=
 =?us-ascii?Q?KXDEattiHn7MU8vJ7eeNqLdQS5SKGU4DhRxteG7Oxo7nE5ml8+XFIzovzYSq?=
 =?us-ascii?Q?85APiLCfwirLBaCzLbyh2Mid4nwBi2fN4I8Rrb8+IyQgEKzA9BKaSpBiIPTL?=
 =?us-ascii?Q?EozZYtTovQiK2OSF8MUnuMsWcJPGn9Y5gY1vRz+ihXlhLENUCTICRsz/opEn?=
 =?us-ascii?Q?rC6qtb37st22SX0nGPUMatB4xrybQWx6lZKVIXNMVcnJcuvb/DkfN2VosYOk?=
 =?us-ascii?Q?ADDjqwHWav1hhQjNfPu1r/qisj8B4RRdEtwO1Ph+UUMT0dxIgVESCf01MHHS?=
 =?us-ascii?Q?zaWwzqdhHJ4Ib1YQWLtjwuj9RM8ZacsjJGhEmrGGgqmfSTMqc2GmkJdTHQtW?=
 =?us-ascii?Q?3CwlK/A5bitMftH2XcIMKGKvz3scYpVfC57Kj0yO085t0xDaVhTmGAYesBN+?=
 =?us-ascii?Q?z0r9x7URIs7nXksNPRD3qNJsKN86VNS856wJb5mvEPW8/YcckFi0ZOnrFq9g?=
 =?us-ascii?Q?9RVJMBoHXLOrRxVT83gBbHqCMcMwksBlf+HflQQ48mn4klJzD57rgsZMZbpr?=
 =?us-ascii?Q?2o+9ktOXx6L7oaCuP3dmsRRXyRssm8CY4PQA5avS+CFdcrJpr+rQDXwQK3ns?=
 =?us-ascii?Q?UDvQE9xcmVf57MC0euGeBlm4eRRuWQvtUDSxYaWP7ENOF8GQaWI/ysgHRKat?=
 =?us-ascii?Q?OjuR3OhYiJqzwea1V5BBd8EWJ5ra5Rfqtbo5U4aWkn+vCffyv6wuEldGIFl5?=
 =?us-ascii?Q?fJso7fmIG/mw4tOWsWzHO2YS3AtKAZf4pMlue1RG88+8u2qY/raUhgLtlDrN?=
 =?us-ascii?Q?yYXmApJEDqCQhtK9v+48PA6CIRpipJheIlL8qLiOFMib7JpXRt+PcI5Cjone?=
 =?us-ascii?Q?goC+jAqqsN4ul2Oy0lv2IzF/RQ/s6sTMpVR0jI6B1TJhXkA8P81LRi/zTYm+?=
 =?us-ascii?Q?QQ7zNQFWW+JWpK4wSfrcf0SGNDaqj8Z87CUrbvajqnpsG2WOlgCudgUex6zP?=
 =?us-ascii?Q?hPPCSG5CfWsx5c63p9ufcAjUUkxC3GfH7afvie656xB6R4KIQZ02TYDA+20z?=
 =?us-ascii?Q?lEQl4z9lxPvFamXYDdqBMxLxuSn9rh6El9CvMOoal7x8ittwGuMrVA60dzeE?=
 =?us-ascii?Q?TldFM6ul6y+5G05engfsfj72YPdDC5KsQjp1wsexKA6qwaWRPzuzil63xCZ4?=
 =?us-ascii?Q?kZ+AH13fRS0gphtWSQTFp1Wg37CWWSEzdHhDppdCRqiUo+T3ZdsyEbCz1/8F?=
 =?us-ascii?Q?miYdUTBIIOpSio0k5EwAcuiboZG2etE+NItCtzbcuxoCkiHfqXVAPb6kSoz6?=
 =?us-ascii?Q?WeEJQmx7cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6D+EOu2SB1/EuNzjry5MrMC6TNRIUT3i/rJv4UhIjqplVgP36sp5stkvd+WhaOV0gVIQMDhvfT9w9bdsDThRxHEB1mAh3UjvMAZI1uju0CUIZc6weg3dNFnzSV3nnWWxR3wCg+fv/k19Dh2de4feCD0dZ8lEkepmLaglH2V199EDpBAiAAiq6axBU7JyWYmquzZkERvPpfta1eyXexaMQo0qsQjV+bEa8rnTjc3DJbrBgDlkr3wkcrH6efiGSPdVywqK7RJhAPYvLrLC1BPWxbi47ndMlhUR/iX4U0bgMFBmR7iEwdnwaq8tMKWcBKckMMZ71NQVfmXUK+EGNzSThwxdKpx1ceDjfpwy8t6wnu3yqBDTGpdbSVOixkEof7h6rQJtTHOZPlOWNHv2Jn1r+scqS7JwJd7uw4utHZjLr1sLPCDsvcTH86/Ix+DErr8kzfX5b4RVZlxhTWZBy+LQIu5zr43wjV+e/Mgv1cDDK69zfAUa8JeuD6QGxDwO5xUaahHPiE6uYolbyBRy/Td2yaTNS7ZRHLMWCqBwMifSD8X2Dk5POsblJfCixxs33rgKHpFugoNHdoh4SZkhyzQxQ+C8Gl5g8FtJsQ5w8IrMTDE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f12f34d-834a-4dd5-e3e5-08de5c96dfc4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 04:53:40.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RWCQgI7HJqXxk21C1rrpMDqqhLWu5o0fd1yUB7pzIXf+gbINxy3FJJkCrET3BxqnIrSnqSVUncHF7Jcswytig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601260040
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA0MCBTYWx0ZWRfX4x0a98kybqNq
 HuFa4xe34KxBvbAoTJEQMqb/6CXb5KHbiQS5TNIE5r/48DRumjJCXDmlAEd+VpR0UK3OClMiOEe
 +7rtYX4BWaKTRBpb0oyGSpyaFII96TcwlDEKQkCetf1RTQE6KHCBJ5z3rMJQE4xgSmNJe1+/8QW
 5+sBebT92gobHhHx7FwAC/lr6VmgdxvgLihXJ6Q9c9YImT7FxpYjsOVxYrpPBpLbawPNg6QeRPa
 fqzUBw4Qqsp751zB1aYqTPYyf8B59aKgLuIyif9RQRk7pVMKW9Ovpy7OyB5yUC73Xj+ToCS3OO2
 0ljvGrrsu8jkJ7ertHhGwG2H6h7lwt47GeUWaSqNytfrtBDbzRX8hh/WKHpbtzcz5aDb4zvBbFn
 HQW/uiByejnu72VReEL46nLWU58x2nK0kCFeZ4SsXQ+WT/qyuJDhnFgQhNVyxSxaUijAzpTghVL
 Pwydce4xqA+xOfcK3gJXbY3NXV3JNlZQAPDbXCb4=
X-Proofpoint-ORIG-GUID: lc-GI3WrpoY0GEad8Ses9Gz9uVheBA-l
X-Authority-Analysis: v=2.4 cv=Rp7I7SmK c=1 sm=1 tr=0 ts=6976f35b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=itjc2HJwaFiNjp597ioA:9 cc=ntf awl=host:12103
X-Proofpoint-GUID: lc-GI3WrpoY0GEad8Ses9Gz9uVheBA-l

From: Eugene Loh <eugene.loh@oracle.com>

Uploading the existing context file to generative AI using either
openai.gpt-4.1 or openai.gpt-5.2 led to the AI assistant producing D
scripts with "if" statements, even though such statements have never
been supported in the D language.  Asking the assistant why, it had
muddled explanations, like "if" being a reserved keyword in D, etc.

Modifying the context file to forbid "if" explicitly had limited success
at first.  In one case, the assistant explained, "The context clearly
states not to do that.  Despite this instruction, I used it likely due
to a habitual programming pattern."

I finally got a statement strong enough to eliminate the use of "if" for
some simple prompts I tried.  I used both openai.gpt-4.1 and 5.2, trying
each LLM with old and new context files, 3 times each since generate AI
is not deterministic.  The old file always result in "if";  the new file
never did.

There is currently no automated testing for these context files, which
clearly depend on the gen AI assistant anyhow.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 llm/llms-dtrace-complete.txt | 12 +++++++++++-
 llm/llms-dtrace-short.txt    | 12 +++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
index 8a4a535c8..818e0086f 100644
--- a/llm/llms-dtrace-complete.txt
+++ b/llm/llms-dtrace-complete.txt
@@ -4,6 +4,9 @@ You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid
 
 DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
 
+WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
+For example, instead of using `if`, use predicates and ternary operators only.
+
 Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
 
 After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
@@ -103,7 +106,14 @@ PART 2: TYPES, OPERATORS, EXPRESSIONS
 ## IDENTIFIERS & KEYWORDS
 - Identifiers: letters, digits, underscore; must start with letter/_
 - Reserved keywords (subset relevant to D):  
-  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
+  break, const, enum, extern, float, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, this, translator, typedef, union, unsigned, void, volatile, xlate
+- There are imporant differences between C and D.  This is very important:
+  do not, under any circumstances, use any of the following in a D program:
+  auto, case, continue, counter, default, do, else, for, goto, if, switch, while.
+  Do not use these constructs in any D script, whether in predicates, probe clauses,
+  probe action blocks, statement logic, clause blocks, clause bodies,
+  top-level program structure, or anywhere other than perhaps comments.
+  For conditional execution, use predicates or ternary `?:` operators.
 - Avoid names starting with `_` (reserved for system)
 
 ## DATA TYPES
diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
index 01f9f408b..19d5f73e5 100644
--- a/llm/llms-dtrace-short.txt
+++ b/llm/llms-dtrace-short.txt
@@ -4,6 +4,9 @@ You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid
 
 DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
 
+WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
+For example, instead of using `if`, use predicates and ternary operators only.
+
 Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
 
 After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
@@ -103,7 +106,14 @@ PART 2: TYPES, OPERATORS, EXPRESSIONS
 ## IDENTIFIERS & KEYWORDS
 - Identifiers: letters, digits, underscore; must start with letter/_
 - Reserved keywords (subset relevant to D):
-  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
+  break, const, enum, extern, float, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, this, translator, typedef, union, unsigned, void, volatile, xlate
+- There are imporant differences between C and D.  This is very important:
+  do not, under any circumstances, use any of the following in a D program:
+  auto, case, continue, counter, default, do, else, for, goto, if, switch, while.
+  Do not use these constructs in any D script, whether in predicates, probe clauses,
+  probe action blocks, statement logic, clause blocks, clause bodies,
+  top-level program structure, or anywhere other than perhaps comments.
+  For conditional execution, use predicates or ternary `?:` operators.
 - Avoid names starting with `_` (reserved for system)
 
 ## DATA TYPES
-- 
2.47.3

