Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AA417555
	for <dtrace@lists.linux.dev>; Wed,  5 Jun 2024 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717611509; cv=fail; b=kyquP9Hh4V2mJUV5UZzyfzc0kf3ao+u9kKuOwMJhB0QQnsf0xaPASddEe2IBIfBgpcYOMWGACBABMgAo/nfk426mQm7diZE2HEsEM7owBvh8ctMBFDMmbHc7k1NkAab34JaWGsvcCgTltdMvLQOEPuqDqBE1s1kNqwvnQj1kBEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717611509; c=relaxed/simple;
	bh=ndH9yemalmqZf99OZKbdxyz1X7SnvEzJPU1AyrrEXYM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fO+dVYzfBNjPKXmjoJjv8caYcXUTv7MgWjWkG4yZ+JgOOF7sOU5AduZ38SiVwyHomPaGEQAgHHzOwXI9/lEDrmDTDOTCUApRUI+AiH+ytPU3h/TXVIhH2fsGn5+gRPQB/RryJb4dbpW8i/lsh4n3JMGyJsE4nYorSU1tD8oxW34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Kqjbq4LF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ouZGo5d9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Kqjbq4LF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ouZGo5d9"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455Bf98i028905
	for <dtrace@lists.linux.dev>; Wed, 5 Jun 2024 18:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=OAzkYqMg0p0fs2mMFPExYsPdcwSRm/6WuZGZScg+i58=;
 b=Kqjbq4LF+JHrjFuwDSZxB970KGZjNLdqgqTV/JcgEhdxT8VyPE3AC4Iqf999NCg82Kgs
 bTZlZHKZyqXApMH6IpwiltFHm7SEyucbU/w7xxYeqhbGE355limcpMQMW1c04JaomrOS
 I9SnxZSQjzwcMqvDmo39XibfB/nuyMjnpFL/QU7LRTIKipqIqR3YkQFuZJioHCDhAXxD
 CBUKp/HAePCAKcRc3o9FwEDLSf1Zv2YWaWPzVWmJfk0IGj1xuV3zQOsLnwkfAgTOU5gw
 WDgkdeVe9gF/9ielrmLvcnq+nL60TZiTpihzlzYBP5vyFSgTY06Y7/lIGZRz7UnwbpJx jw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbussysu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 05 Jun 2024 18:18:25 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 455Hb32T024024
	for <dtrace@lists.linux.dev>; Wed, 5 Jun 2024 18:18:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrqyn912-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 05 Jun 2024 18:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik5c7LdC7GoXnn7924Xg1jjKQPSX1gKTx+2EjF0iFwcAI1MsuRN/O4cPDMXEFf+R05PF93US+no1Vd0oqfP4y4TJa+dMvDdrpxbs1ajn3dfbk0vz3d9JUqnzJmunlO1jHd/wSeujeGQ4iBz2JhdE3jtwcpDI/yLWBY+5IbwgCO5WaNio7TdmkoQkERilkY7fpAbePuUizJEI50DCoh+C/+TYRHjbc2tgKz+tUBAogoAoZVOERWSZLvtDHnB3nJjd5kIzkjgxIpq7A9i7+bcMHEZYCSr2Ylxd7DCCbb7qI9L98rCOUp9fll+24l7FLXwYfb7+hrXuBDe3T422fp/SdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAzkYqMg0p0fs2mMFPExYsPdcwSRm/6WuZGZScg+i58=;
 b=VblZkA1GQQ+Ly1398wLJwY4BgzdQV3AnZKoq4tQT+m9djzhBULbEUmiHwUuc4Ik9c9ZTaVprHasLT8ehd4bxV6O9DrihonEtBsluNzfBdBdMDIMGKKRAX6I8vjggJzUrljZnO8+360tYTRCSjrwQAUMn7FaH1lVabsUJm6MbIaKiHTE9rxkz0R36AeqEkRZLSz3RlM0PtdycHp4yW/nu4p3Le72Kmb1yaFsIWWOtNl06nRsq8rYXUBA2R7FYczwy9miPmwYJEu80i22rNpzTjMOCyPWBemJ1ZbyaQgAk+cnke1vAYyu1EfUd3kYuhBONHqLLZOeCosANPboJx96k3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAzkYqMg0p0fs2mMFPExYsPdcwSRm/6WuZGZScg+i58=;
 b=ouZGo5d9WyDtqDcrt2Fw7uGoetwHAi2ctswcwRhYOEA3/i1prcJ/6hKncUbCFpQBBcsLGMQgHPj8juBFgpz1mDh5+OBB2/YUZJmab3OEta4LHA7wnEasuWmbvagZgo5v4v+o1XCEgf3m00A843er297MLk9M6R/Q5GzrhaGjFQo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4215.namprd10.prod.outlook.com (2603:10b6:610:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 18:18:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.032; Wed, 5 Jun 2024
 18:18:21 +0000
Message-ID: <e1254b7c-23cb-48af-3ada-e8563fdd8770@oracle.com>
Date: Wed, 5 Jun 2024 14:18:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 02/14] Clean up prp/uprp variable names
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-3-eugene.loh@oracle.com> <Zl9gqz2tK+BdRRSf@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zl9gqz2tK+BdRRSf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f6ab9a-9336-4d40-c1bd-08dc858be1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGhPalQydjJMZC93cnJyLzZDVUR2QzVFS2hraExheERIZDVydGJZS0I3QStI?=
 =?utf-8?B?Rm56NlRwbjRJcXJZamhEVjFhVE9EK0FkQkNmN3hoQ3ZmZGtNcDZLUDBtWjFS?=
 =?utf-8?B?TWc3dUJydkJNWlpBWUJvc202bm9UN0lhbFZEblo0Z3Zibk9CU3pZZlpzaUJD?=
 =?utf-8?B?aEZEMVo5amt6UEdBTnRGZ2xEUE8ycnlUemZEZ3EzOXM2ZlhtWDBZVW9NNDdL?=
 =?utf-8?B?TEpmMzVaZFpZN3g3MkFaSkZNbnVJQ0pKNlpiM2Q0MFIrSWl1TTZmQU1qVnpY?=
 =?utf-8?B?V0dCK3RISytJdVdFbVh5bjJmZWZINjdMZ3RvT0gxTXNjMWVycnZ6L3QyUTYw?=
 =?utf-8?B?cWU2dzVTVUMxNVI2dFluS1NxMGwwVVZZUmd6YkMzK21BNUVzU0VyZ0FwZ3o5?=
 =?utf-8?B?UDFncms2WERyWnhYS0RvU2tIMDRORTU5MmJsRzQ2NTlHUVRzMU5nT3ZBellB?=
 =?utf-8?B?NGN5eTNKcXhHS2dRRTRheUpCSktnNVUyUTQ1YWFvenpzWlpLeXBkK3BzeUR1?=
 =?utf-8?B?V0xVS05odTEvQzk5elUwUFhTRnJGV09yUWFLK3FkM3FoZ2NjNGpEQ1NXZWFS?=
 =?utf-8?B?enRMMEUveHZteVRtaUNZUm52WGI1c0ZhNDNDbjY4TUh2aU5SZG9KUlR0Q0dt?=
 =?utf-8?B?ZjFtSjdpQkFyZ3JQRUtDZkMrQkhxYzFhWWhVdGRxQU04alk4ZVlCR0g5SHg4?=
 =?utf-8?B?Ukg2bWpRZUVTWGxvcXluRnFBQy9VdjNOQjk5bUM1MjhhTzdsQklocTBLMU9V?=
 =?utf-8?B?TnlRNk1PM21VaUEzM0VYcktEam0yTld4MzFxTzRycEphQVNyaWRrMmJ3ODRv?=
 =?utf-8?B?L3pEOUV6Q0tsSk8xK3N6VmhYa0djaDRZekdodHBsSHdCc2hVZVU5Q2xmWWFE?=
 =?utf-8?B?QTV4Rjh1L0dNa0tkZUtWZVQzazJYam0xODdLcXRpNzZsN2F1OEhNV2NkUnF4?=
 =?utf-8?B?eVluQzV2eXZ5cWZiMmtQbkVlbnVYMUhjNForS1VUeXl4MElwZHB4QnVGNUc5?=
 =?utf-8?B?dTU0N1piNk5zaFdlWCtmNEhsVVZLSUZGdytuY09wdWx4T0dBMW1hQnNkUmJj?=
 =?utf-8?B?UjhjU0RiYXlHMEczTGc0eWhzSmpSdWRFNVArL3dzVk1OdlFzRWM2OWZEUEo4?=
 =?utf-8?B?QklkL09ES0ZTNGxQd29EUmpRUk5JbXhZd1ZLWC9wdXZGZC84SzVCWkNiNkRj?=
 =?utf-8?B?REpQZ1BWU3N3Yy9ydStTOG5NMXlXNTJBQlZSYWFVdEZudE5veDRLUzdwRTlD?=
 =?utf-8?B?Ti9Md1BEbXlHcGJROXVnTW5nbmRaUUNJbmxKemZoRkZwRHR0SFJkMW0zaElO?=
 =?utf-8?B?QzdLRjZITWx2aVYrV281UW9NVVdlZ2NhL01PekNNSmQwQmtsNzJhZHZMZmVT?=
 =?utf-8?B?cUNwSTFsWXNJa0syUjk3ZmVqVXo4WTFhK1E5czBsemhqdDhNSjI4aklJZURq?=
 =?utf-8?B?SWllWDhhVWVMSEV3eGRoTUZUc25rU1RvckJBbFppMnNaUVFyMVNOTWlYenBs?=
 =?utf-8?B?d0w2N1B6aVFvaERQVXpIbEt4OVRFc05jUi9XMWkxS1hYUERhUWltYTRlWVhW?=
 =?utf-8?B?ejhHaDQwbm5rVFRnRjJBekRYM1NOQmJDb3dma1JpZnFXakd2S1p2c3BQTnNZ?=
 =?utf-8?B?eTl2UEx2Z0VRTHplaW5Mc2dXNURURXRkWmZlaDFhQ2o5c1dHY1YxU1p3Mytx?=
 =?utf-8?B?TVk2ZXRnbE01MUg5a1pFN240cCtsalRkZWlpWDlLK0Y5dHhTeDdJcjlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUtXbnpRQWRQTW44cFBTWENWWXZBVklXeEF0azhzSndDblZTZVNNTUs4Wk9Y?=
 =?utf-8?B?T1dNMnpBa3F6LzN5WTh0bzNDaUNiZkRTbWVFblE5NksvWmVPUmpSWWVvZ2Y5?=
 =?utf-8?B?OW5rNHB4MVk3aDdqajdaeENWa1J2UW81dmduT3ZRUnFjWnJaVDI2V0JxWXlN?=
 =?utf-8?B?NHNVNld0RGlQQ0t3WFlhU0R6U1prTENjTWRZQ1Q5aGgzUUxPMEVnYS9pS2ZR?=
 =?utf-8?B?aGpGRnEzUERtbEd0Rm9LVHNyMXBWU0w2ZDdSWGkydnFJSVZmakpBNkhiNmFL?=
 =?utf-8?B?Um54VTVQQi9LTnVRYjJmcVZRNDV4T2FLNGJ4ZHJuQnY3RG1SdHZ4UytId3RZ?=
 =?utf-8?B?QWRHR3E2YkdYKzhJSm9XSjUzRXlxL0RYMGZ1cHhTSVMyYTdTSUx6YVRFK3l1?=
 =?utf-8?B?VCtTcEx2YVJpakc2Tml2M2FUdldhZ1RxdEtVekMxcEIxV1p3SGpINTlQNEZi?=
 =?utf-8?B?M3FxN3JTVFdOdVVETmZhWkJRUGJjczRGWW1GcXd5cWU3MXFuSkV3VDh5L3JO?=
 =?utf-8?B?WFVrTnlRMmhEU2d5dm5JT1hVeGZHa2wrSkVsVitrMUFkUmdXT0RrbHJyMXVW?=
 =?utf-8?B?ZmJFR0tZVkxYQis0UjZQcWhaM0JaR21MMW1KYThUd2sxc2wyWTNLdUE2NFoz?=
 =?utf-8?B?S1paMjYvWmtpeWdFOGJCdXhOdjgyVEVjeUtGTFgwelhCNnppTHlFUUNmZFVa?=
 =?utf-8?B?UXI3RUNSWS83UlFoTnlIQnMrTmcvSTQzc3lNeHFoMzV0WS8vZlM3ZlBrTDRp?=
 =?utf-8?B?Q2Y4bFkrMkVEaEdrbVF6emJka0JKT1o1dTIwaFZPWUtEdWFFamlpWlZYdHor?=
 =?utf-8?B?RW1meTBZeTZpNHlhZEFFK0JlUkhacWo2NHZabjR3UUdyejN3d0UwYVR0RGJm?=
 =?utf-8?B?eUZzZUc3c0ZjUGRMd2JSNUVob09ZOTVYSEd2dnVMMmFtZDRrQ1BpaUtmaDk4?=
 =?utf-8?B?U09mekV0YVVENlc0ZGZmbksxRWQ0TnoxNDg5Skd4Y2xaSEI3NE9YMkxYaTBF?=
 =?utf-8?B?WW8vSnVOd3R1d0MxTUV3bEJxbDdQWDBBU3h5MUdMdTZENGNKRDlWTk1abVpT?=
 =?utf-8?B?TmwwZjJCeG5pK3VuSS95WU5VZWlNRmZBbW9Nd2daZFFWWmhuOGhGSEVObnpl?=
 =?utf-8?B?YmlYeFh4UmVCenoyQ2h3eXdocGcwaS9OV2tqa20zSHZROXhYdTFLSVlCdUc0?=
 =?utf-8?B?bElML2R3eFF2VUhnc0FRWGo3dHRxdkFLVXZrSG5FeStyOTg2WU44cHdmOFZy?=
 =?utf-8?B?NXhqSVlsbFpwd25JaXlXaHh6Qkp6NUxMNGFCTjk0c3hJcTF0WUsrQmxLak1a?=
 =?utf-8?B?M1RmREExUUw4Y3BpUkFYTUFadGJxWFI4dEt1N0JCeHRoVUdmUUVMbFZUVGxC?=
 =?utf-8?B?aHZJRFVLMUE4aVE1bkR5MjcxT2FYWTkyamszMkdzVC9YazM0ZFVGZWdTRjdU?=
 =?utf-8?B?dEMwQlcyazNwZVN1TDJ0TGM3SXRwTFlVdTlNbjRXT2EvNHkvcFd6OXFOOUI1?=
 =?utf-8?B?SXp6a2JsUzFaMkV4bVBMUTRVTXVHVnNPTG1neUEwb0FNQ0oyNVlTamdBM0Zu?=
 =?utf-8?B?OGJ5d21LeS9GeUZOenhrWGNiWUk2bFI0eFk4R2I3cThMWjg2NE5wOUl2WU84?=
 =?utf-8?B?TFEzSlVnTUVDTVZsNzJEQjR2b2djUEFFSGpoNjMrbEsraDlKa2VPWDRDeStq?=
 =?utf-8?B?MjNqa1Z5ays1bmNGbFdDRm5uOEhvL2czMzd5Tmc5Zm5oQUo3eW1GVHkwM2Vw?=
 =?utf-8?B?dEV0SnM3UFRUYUdIaHdFcjhvQTd6WWpoa3k5S1A5S0RoNlh6YUZUVXQ1VXVt?=
 =?utf-8?B?TDVTcUU5RU5YR0ZIelUrL04zaC9RdElPeWlXbjNwa1pvblBoT2RsbFl6d253?=
 =?utf-8?B?UnJ0MTlpWTdYUFh3Y1AzcjdhYkpocXRhdS9mTmp6TTMveWhoTGM3MFp4Q3pK?=
 =?utf-8?B?ZGpLUVVtUWkzUFRrWUJ4TUdGWmVDMXYzZFZoNFg0TEsrWC9JbGVJOEZ5aTZy?=
 =?utf-8?B?TTI0dVFIdUkrNGd0Ty9ZOHBHdUZiSForTkpYNTB4clY1YXkxTEZTQURjdTVj?=
 =?utf-8?B?bzVsQXk0bXgvREtWTXY5YWx3RGhISjFhNFpMOUxXRUh4U3RZOGZ5WFBMYVhK?=
 =?utf-8?Q?SNW2BBn8cOIOpdtcPwYZsjmYF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	51WgeIaSQCtQjsIs9LZu+H9WWu3/WihPO9PLNJAqbrD3FfgnHmJPxTdhEZt6mQyIhXzcLliXP/VNrWNYfFo39P3zLnbauLRywGBcf3A1pmBH0XDqYzwE8QHP+nAyjTpwvrZmwhV5VwP9O3XZEJBPg524QmYJMIHIbnzQJsHmaZV2dn2DBx1H4a9YoglzlrNAyPOrvVGI548HVfh1Q1Fa7HGs3wtncvdWP0eLHsH5S4C7crs/PlXsPGwcPEecObsyFAHrzsJh8GLPNiIJnJKAvniAJeHUGxCIJZQ/7OuKvSsbMZTi+Gc3UlhipS18FJqlctum9hdT86SY33xPh8Nup62XCOr4K1oXi7OogufS/0G56cz+DL/HWw/ZVOthBz99kiGTGeiVC/aJmeU/K2zbPCjjnNl2/P6RCKCmTf4DbwpVvPhcmg5Ll7ke/dxsSe+paUxfBdomlaBLaAXG9kYOZpPqSehuWxp9BhoW70F2lfccWL2KleZoLDZMie18XcgQi4A58/+rkcR52HLpv/l/CwYckIlbCUcREzJq/ysqHrQ/TUsNMdl1ldyEwf3lY/LOILNTWpT/1zj5rLgATbMeZ8laIuYmECDav3ze9FCecis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f6ab9a-9336-4d40-c1bd-08dc858be1f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:18:21.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM+0yBwvAceYDazDUE+UzkNmXfkD5riK24rWwbKq7iaXfAZwKPPc/F7Mcm8pNSr2rpySqNv6DTydzRY88InGRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4215
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050137
X-Proofpoint-ORIG-GUID: 76T8p94DL6i9Y40DL2BbHWM2U8Y3IbAO
X-Proofpoint-GUID: 76T8p94DL6i9Y40DL2BbHWM2U8Y3IbAO

On 6/4/24 14:44, Kris Van Hees wrote:

> On Tue, Jun 04, 2024 at 02:11:01PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Should prp be oprp?  Or should we use opr and upr?
> This does not belong in the commit message.  But yes, we should stick with
> prp for the overlying probe, which is consistent with the rest of the code
> base.

Yes, the comment was to solicit feedback like this.  I'll go with "prp" 
I guess, even though Nick (elsewhere) voted for "oprp".  I liked "oprp" 
because it's more explicit and the same number of letters as "uprp", but 
sticking with "prp" is simpler and arguably clear enough given the 
changes in this patch.

> Also, I think this patch should address a few other issues in this file, e.g.
> making sure comments are consistent with the code (e.g. if it mentions we are
> creating overlying and underlying probe lists, the code should also create
> tgem in that order - or the comment ought to be updated to match the code
> order).  etc...

I didn't find much else in the file.  I cleaned up some provide_probe() 
stuff (I'm guessing it's what you're referring to), but if there is 
something else egregious you're concerned about let me know.

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_prov_uprobe.c | 55 +++++++++++++++++++++++++++-----------
>>   1 file changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index afc1f628..cace406d 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -6,6 +6,31 @@
>>    *
>>    * The uprobe-based provider for DTrace (implementing pid and USDT providers).
>>    */
>> +/*
>> + * This file uses both overlying probes (specified by the user) as well as
>> + * underlying probes (the uprobes recognized by the kernel).  To minimize
>> + * confusion, this file should use consistent variable names:
>> + *
>> + *     dt_probe_t	*prp;   //  overlying probe
>> + *     dt_probe_t	*uprp;  // underlying probe
>> + *
>> + *             Either one might be returned by dt_probe_lookup() or
>> + *             dt_probe_insert() or added to dt_enablings[] or dt_probes[].
>> + *             Further, uprp might be returned by create_underlying().
>> + *
>> + *     dt_uprobe_t	*upp;   // uprobe associated with an underlying probe
>> + *
>> + *     list_probe_t	*pop;   //  overlying probe list
>> + *     list_probe_t	*pup;   // underlying probe list
>> + *
>> + * The provider-specific prv_data has these meanings:
>> + *
>> + *     prp->prv_data            // dt_list_t of associated underlying probes
>> + *
>> + *     uprp->prv_data           // upp (the associated uprobe)
>> + *
>> + * Finally, note that upp->probes is a dt_list_t of overlying probes.
>> + */
> This comment block is too verbose and I don't think it is really needed, if you
> are going to rename variables anyway to be consistent based on your proposal
> (as you do in this patch).  So, the comment becomes unnecessary by the patch
> itself.
>
> Even if we were to retain a comment like this, I think it should be much more
> brief.  But again, I think the patch itself accomplishes all that is needed,
> so no need to comment.
>
>>   #include <sys/types.h>
>>   #include <assert.h>
>>   #include <errno.h>
>> @@ -118,7 +143,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>   	char			mod[DTRACE_MODNAMELEN];
>>   	char			prb[DTRACE_NAMELEN];
>>   	dtrace_probedesc_t	pd;
>> -	dt_probe_t		*prp;
>> +	dt_probe_t		*uprp;
> I am OK with doing this renaming of variable name because you want some form
> of consustency throughout this file, but I don't believe it is really needed.
> This function only deals with one type of probes, identified both in the
> comment and the function name as underlying probes.  So, the prp variable that
> is used in many places in DTrace source code to denote a probe pointer should
> not cause any confusion.
>
> But if you want to change it, no problem.
>
>>   	dt_uprobe_t		*upp;
>>   	int			is_enabled = 0;
>>   
>> @@ -160,8 +185,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>   	pd.fun = psp->pps_fun;
>>   	pd.prb = prb;
>>   
>> -	prp = dt_probe_lookup(dtp, &pd);
>> -	if (prp == NULL) {
>> +	uprp = dt_probe_lookup(dtp, &pd);
>> +	if (uprp == NULL) {
>>   		dt_provider_t	*pvp;
>>   
>>   		/* Get the provider for underlying probes. */
>> @@ -182,12 +207,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>   		if (upp->tp == NULL)
>>   			goto fail;
>>   
>> -		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
>> +		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
>>   				      upp);
>> -		if (prp == NULL)
>> +		if (uprp == NULL)
>>   			goto fail;
>>   	} else
>> -		upp = prp->prv_data;
>> +		upp = uprp->prv_data;
>>   
>>   	switch (psp->pps_type) {
>>   	case DTPPT_RETURN:
>> @@ -202,7 +227,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>   	     */
>>   	}
>>   
>> -	return prp;
>> +	return uprp;
>>   
>>   fail:
>>   	probe_destroy(dtp, upp);
>> @@ -394,8 +419,8 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>>   static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   {
>>   	dt_irlist_t		*dlp = &pcb->pcb_ir;
>> -	const dt_probe_t	*prp = pcb->pcb_probe;
>> -	const dt_uprobe_t	*upp = prp->prv_data;
>> +	const dt_probe_t	*uprp = pcb->pcb_probe;
>> +	const dt_uprobe_t	*upp = uprp->prv_data;
>>   	const list_probe_t	*pop;
>>   	uint_t			lbl_exit = pcb->pcb_exitlbl;
>>   
>> @@ -508,8 +533,8 @@ copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
>>   static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>>   {
>>   	dt_irlist_t		*dlp = &pcb->pcb_ir;
>> -	const dt_probe_t	*prp = pcb->pcb_probe;
>> -	const dt_uprobe_t	*upp = prp->prv_data;
>> +	const dt_probe_t	*uprp = pcb->pcb_probe;
>> +	const dt_uprobe_t	*upp = uprp->prv_data;
>>   	const list_probe_t	*pop;
>>   	uint_t			lbl_assign = dt_irlist_label(dlp);
>>   	uint_t			lbl_exit = pcb->pcb_exitlbl;
>> @@ -636,9 +661,9 @@ out:
>>   	return name;
>>   }
>>   
>> -static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>> +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>>   {
>> -	dt_uprobe_t	*upp = prp->prv_data;
>> +	dt_uprobe_t	*upp = uprp->prv_data;
>>   	tp_probe_t	*tpp = upp->tp;
>>   	FILE		*f;
>>   	char		*fn;
>> @@ -733,9 +758,9 @@ out:
>>    * probes that didn't get created.  If the removal fails for some reason we are
>>    * out of luck - fortunately it is not harmful to the system as a whole.
>>    */
>> -static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>>   {
>> -	dt_uprobe_t	*upp = prp->prv_data;
>> +	dt_uprobe_t	*upp = uprp->prv_data;
>>   	tp_probe_t	*tpp = upp->tp;
>>   
>>   	if (!dt_tp_has_info(tpp))
>> -- 
>> 2.18.4
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
