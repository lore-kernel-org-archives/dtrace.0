Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE614A0B2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908975; cv=fail; b=E2hnKpLoDPd6ZH44xCa7jS7rq8heZuIEtQZMuyusLYKV8cPIRYjvR6a4rTHvZhk4zq7BBh2GSO8NUGbOuSAr/0TWyUehKDD7fjMVJI/f7mDbPhkGUzdO20HgDUOZwEeAVTAIL19BLY5Wt3uJJHv3mk8NsJnENmAWGckt89NKdmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908975; c=relaxed/simple;
	bh=GHqvkMqfkeHD4e0wbCZG047UKd1u0G6r0ufUE7wGILM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ok1fpmfi7CXVLH8lpfUsZd6KCa1Y44mHf4vGKIFdAM2bMq/ZLI50lX/RIbdRPxQCZYzHx3NA7OAp1EHZLMci7kwSiY4jTRidGWVQlpDUm9PI9E8PiW15FVDxnwX5BwoF8Itkg/XgD86e3kUMm+KTWpJq6ydrv/HOxnBueNVScNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OIr5Y6Fc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AjwpjunV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OIr5Y6Fc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AjwpjunV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fYc3030244
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=HUu/RaPokqU0VB
	eHyvZnWWniN3DFlNMh+V1yKYAMlWM=; b=OIr5Y6FcYa5ppqjF7Ey2fl3lddDsXw
	qjx7aFHSTVqiueeiizdvh7xujc+R0dYEw2YsXcyumOGbbZh/ut+v4/iNoauqk+zk
	vAzuoe80Z3V1QYi7f4fSMXe2QlCXbmNXXAzUnodhecDr32N0WI3f8dpWw3ly6nji
	JJGiPulDnzZR97ZdL0cg3v9MxWFcyNrl4zQccwuuSBkMUPnTyB+qqRYEPiHQ9h8V
	KeCxbnVX/e25JyJcrVRFCnSLuiyGEC4K51tIA7OtfjEXVMLyVnFfjhSNeDSvO15e
	pQmro5Tksnr4JVP9pKxQATmJ1ZpzoEJZTiA7/RVzQt8NtbGLj5a9vogw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pup3bj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T54P4b034765
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfhv7-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTJKouhVPFCFTOLP9UgUOB/FRGhiueFOobz2CdJ4W98DMxxupAygH7xNeA66FCWfeIAqEQEb1Ja4WozlCTa+7q2YneNxpSCP72sKWtJN/16rosV8kdPLgp2dztW+xmiCe4leJ0nA7/gWS4ts4F+D8CgP2BxqWv+lvFWsvD23TbiRb5lfXxivTaZ4kCPkcC9HMJd6SC89ukh1eX6r9rdkyNTd/DtQM5ge0HixvuSbSPiLgFzMX4DmA4mW8vFKuozc+xpgBtWthZGYrMyDZfuOZWcYI/9Qh6BhIJV3vNB45ds59QQjJGmbEo7Y9Z7ZK+8AvK0t+YGPXGmfb7DgrSrkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUu/RaPokqU0VBeHyvZnWWniN3DFlNMh+V1yKYAMlWM=;
 b=HzBv7sllZ/5dchMsWtkgDvqWzYNrVWWh7ipWmFkNduljmqYdML2P+IHl+jrT1Ww+YfE4MalIFvuYBu1AY5urc3xypgbs5xyBSVHbSiVAfX0a3MIi39xZiex2jePwTGPj/mbRaWpTHwwjnjBsrA6lchTWqPxH9oLlZkZc2Q6H0eEUC+/O0J1qY6jTGRsNey2OxiKTLmU/1nDWXyRuytdKgVKL7UuNWFeuWEIB6VvtgzqcELXy6G53M0UHctOClI03yFTVbttFbtuHi6XrD+voLWjtPr5JkblcnCcstPYfQtA55xDb9AVs4/PItclLzH1/qys74u4FNpcqqmwy3TJr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUu/RaPokqU0VBeHyvZnWWniN3DFlNMh+V1yKYAMlWM=;
 b=AjwpjunV9TnqtvaN1oDde4j/BZCx8TAvpOmFNwjaCiOYByndcYlvMdH+tFJf/873d+Xw9x+VMYSVUAUBwlQBduxqASzv3ikI2GolKt+D/1S9jEAyYucFOjXXWj/wMjWMR+NtD7NwJ/WD5SqKg0LpqzL/c9EEXDZuIAufDSez6YU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:22:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:50 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/22] Both dted_uarg and dofe_uarg are unused
Date: Thu, 29 Aug 2024 01:22:11 -0400
Message-Id: <20240829052219.3234-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: d6efa67c-ea60-4b02-ce27-08dcc7ea9fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BxBwNn6ocryKAUeno+OThxAydZtgIYdLK+cns/QFqj90tOTnwnVFL8f55o9Y?=
 =?us-ascii?Q?fU2jz559tHirWD2kI/OsAIIDkfjEytwjU/AzHUBKJHQXXgpYdbUjC1/gGRw2?=
 =?us-ascii?Q?f8zo/ncb92O5lJwR4rR5hf6LLkjcnlyxgOdUo/UH4abGfCUWc2VbzPr/HwgD?=
 =?us-ascii?Q?Bh++rep67KTgxSknF+bPLHEcEKpPX43WaDzO+bKDu+Re/CnRPMugzre5Qpq2?=
 =?us-ascii?Q?wDdM3jWl2ZkuOtdTXDAsj0jRu1EsN3hl1/qYvIk4P7Uq2ACPhAyJu/N4ISN4?=
 =?us-ascii?Q?tHbo+NIplXlUB5ExVXhnXKQdZ2Bei3AbDP961qIPk1aZZxHiniQCgxnzi/qR?=
 =?us-ascii?Q?IcM702ah0m2C7W0qvtLMDEzKkxbFUaFxUS7EDhNMfh4yYYutxDlNfUmJxhS0?=
 =?us-ascii?Q?upwlOhM2E7B9GDCJEbwOaSUYC/LBnCxew3TXkxC+0TXs7/ZLMdhqnFuYEY6U?=
 =?us-ascii?Q?MkrmBNlEvP0YvMMo7H9PbEkZaEaJ4VUhpln7BlrYW0WXvWeHFrtCuNFjZoP7?=
 =?us-ascii?Q?DXKvKzR9WM407AmZ2PiU1LYIHRGf45agxSTmtXTYq+Ar8uI3YBLlxs2nSLhX?=
 =?us-ascii?Q?7RvD2T40iheHekH+ICsZkHPYmPtToucZ99GH598IqZzTRVHWqu0tr8iXlEBE?=
 =?us-ascii?Q?ny3t6Nz98DVyXFpguuwk+yhfbWQ52h395E5L9/uZdBYLtyRoHNCbCtjExfai?=
 =?us-ascii?Q?bnZtxvzb2v1RPFuf0P/PpL5Kz5dAqOkZ0cS7gn5AJbGHs1zUbo7diB4BUalQ?=
 =?us-ascii?Q?3zQMEc1lczptiIHKECB0KhHMtYFwFJW0Zj50Ou45Pdcti7Ey4W04cPy79Q4f?=
 =?us-ascii?Q?LWdfH892r182ACHW2IjRW05g0wDWzOCI3dt6PiuNoaBGMzJA60mjS66JCiJy?=
 =?us-ascii?Q?QaiWQWJhckEe88LW2WixfYba18pLk3sygErOijYVuiZcYF4oleyzNXmP4pu6?=
 =?us-ascii?Q?ge6ON/5y3sC0udBa/JzTKgrt1wNrSO//Q/rKMFf5Wo5W8P4DHIlEgKNWxB5s?=
 =?us-ascii?Q?CGox6NTK6hSXxpJSZJ58uErsJ8eERy0tKHnNZu3nVes9qo9nwR0q6Lo+KU6i?=
 =?us-ascii?Q?BarOQk4BUENVxjxgo8c4M8XG/dWDzHNqkYtmrb8ttkRzRYGsuGR5dr/Dny3z?=
 =?us-ascii?Q?WeEmPY6yAVB2XsSVk6taMqNHoGATMTAh8VPvGNK7bnKlu2TrrJ9/ywRA1hbj?=
 =?us-ascii?Q?1vDXveVd6kQBVHQK0p7phPoajBSaIIZ7a1YgnKBGOwpVKvww1xxSto0M+EmQ?=
 =?us-ascii?Q?R2XZGy80ea1gkiVNdKRcJFV9S3nIRrjF1ryUbMxfTAIZ5UBjBVtVltXZ1hqq?=
 =?us-ascii?Q?c3YITrF3dKmqCEsgB9ulZuIuXlOO4c4DlPoH6dH3mxWFeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c8iaRNE+JkBkhdLPS0+m0Z33vmEyHzOCSzZ8oFerRxS2fG66Fp4oda+YT8O+?=
 =?us-ascii?Q?Xg9Jp9xfPnYVEyDkS4lL15UnoOyTBtVneQXekIM5sNCu0Ra7dTDwLSvx1T+9?=
 =?us-ascii?Q?/oEOkG3msfKIQYBmnjuSBdgbVLlP3ZMVBNv9NqYdMXr/h2U5Hiy9Jfc+X+mi?=
 =?us-ascii?Q?AoDbqsBrp68t6zvcWiGA0XwN1VCali0CkeUPqxh9icbWL/iQA8JrJtrUVddl?=
 =?us-ascii?Q?BA47z0k6drpnuxD1SfwDmKxjkjIT7PwCaCrQciIHtDe38SErt/ObCKUUQi2Z?=
 =?us-ascii?Q?VqbJyZshWUNkiCXAY33EK1HEae3KnIzclP9iSs8MS0dqVoucK2fjj229WzfH?=
 =?us-ascii?Q?dF/iQhrjeDQNP7Z4l4+uIOOCnF5NTXJgixBl7GkmBbg+IKrqQvwsi/jh8vPU?=
 =?us-ascii?Q?fPjN1NSSSThbCeft95fZ0VhgMdnePolgzSgsYApM7XQf5McyjxaYT74Zhjy1?=
 =?us-ascii?Q?3eiGbq4DHjXmeoAgdFyheNumVuftX8Fju3xXKoSlNHiHZjNzxKKCC9c1aF0L?=
 =?us-ascii?Q?60UONux5PX/xj1I2VlEpBdnJxBAio2nDv/9FhlRveqGA0l6S3Yej8bEpYeSK?=
 =?us-ascii?Q?PNSYx43LSw2AGPkhPMmu+H7EqItptzRqc+/cq/NDnHR5AB47HXBZwRceGoHR?=
 =?us-ascii?Q?cIwvEsRvpIwWFB79nigRpppVWNL//Vh+u9bMloE3EGbd4EQQxb4VjnnhWH8M?=
 =?us-ascii?Q?2XpjL8Wt5dX83StbRsB6gdB5jW24bvQgHyTzIbiOtIFJ7V5JkKssprYBA9yh?=
 =?us-ascii?Q?NPIOI+BYXVYzVoNhZte+SJHkMrAKAV3tcO+rxaWOeSSjcISc9+z+34tiWtGJ?=
 =?us-ascii?Q?bY7G3vy+g8gi5VXJzVZDeQa6ZxJ9cu7h9aTweITmKoz1VxX6iOHCNTmbaFuS?=
 =?us-ascii?Q?U1ZNJnpRGzX1f/kGwbk5A0gOc8EDd/WmBLewlPzR5aP4GHTkI6IQp+nctamb?=
 =?us-ascii?Q?XutzT1egRO354kQ+2yogKumGhaVBG3kQqB6ipPYEsjXbTIlBo6g+ZgReyYp/?=
 =?us-ascii?Q?g0FnJ9Pu4+rR7ISLDYFHzlabumrahS4+R83Uoi7ZxzYHco855DB5U4rC+Xkd?=
 =?us-ascii?Q?O1WslpH36tyfBHylPjzrC9/haQNwwM/8rGmlMD7FOaCXTcRKNHHwKZRE1iXh?=
 =?us-ascii?Q?X165rCGTk2GDcdTNRCSUziz7eDU1djFfTu0gESTw3QbAQ+XC+zbiItUahzKI?=
 =?us-ascii?Q?Bjx6l7EnVsMv8aJRzWnzm7LESJTagFSSRy/670MPrRxSPUd8EJMVNzKxd8d0?=
 =?us-ascii?Q?HZCeGeH31wwNFGlnvFwMJrFKifH6my/oOx2yezfZB+NcOnTWIFo5lPJgiS/p?=
 =?us-ascii?Q?Qdrak7xBaJX9ObQUD+6DtrDgwDrZl9IiN9iJuuIopfvmZofaFAVBR6MpveMQ?=
 =?us-ascii?Q?vgpxlTfSu7zkkrAtnGTLfHX215gQfmFVzRHaLF0w/VHexnosascr37F9ZsEb?=
 =?us-ascii?Q?97UHudDSdym2zRRyLOZyNChYuLljkShIF4UYvuRlF0DuMxp13wvtDzpd09Gl?=
 =?us-ascii?Q?yP49gN/QXBQW1R/KuRtVTpsPZ/K/bwpPE/U8yUI/JFm8OMkMKEG4iLXUWSVX?=
 =?us-ascii?Q?w5uMz/mPIHvbJpqTMZ9YclZOm4kvbv9L3nICqnaM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nt/MuzX8U1tpfro5dIF8zdvmGnUbBJeWrwJPLetAf3JkrFUqCRpjTwSrQJriRZUqxk9cYWrUUPZA+x1Bo52+g2JjMl7xemU0Q6YCXWDAmOIZIWfftCNHUAyGeh2frYRyaXR+f0NcK5I1xIKj15WUahJa0WzFbAkxiAhhdVE3FNRl7g4cOoYY2M9vA7wEWBsFp6Y5mMggVAc0Iuv3OYfF3TW/JXQkRbmTyocZeNDVj9dq2mKQ86ozh9kUaYbjd9H8P8hVTWwKc+tIrdoZq/2qbukH3vm+u0jJm12er3bvNXdWUMwovFUgHML43M4zZ/iPystTjZvtd1l6HOGUB0mUxIvAqCw/u8/RD99b5omvjj1B6ttbxspuswDo+p7sB/dyb/jRoEOiPbBEax5T/2DuO1P3gH6HpCMnNFKUaF6E3HeLwjmKElJjrAP7sHF462rPjIFUTkhHHzl7/NlUSGue7BfqIovZZWYbHXebUNX7kqrfqmINXElrnw1s8mvCUZ9hckQgn6AAvcFZROHff8OsdYAZmnRiDLF9xVtpAK9HB+bTyP6KI7arZRspythlASbtvRDMNK8ZsFRPQ4Jv/vxn13/PGTF1dpqrf6T8LP+TNS8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6efa67c-ea60-4b02-ce27-08dcc7ea9fe1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:50.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zhf8nIsb+kVHKq1iN6VApfccpBwvBni2/pDu0DqfFCy0D9huDQlioczyWtXLOXQgjoXx8SMcaC0zPGM5zrbGiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: QjkqYkjoM19pIJ4zfY-BmpFeIGVYAA3L
X-Proofpoint-GUID: QjkqYkjoM19pIJ4zfY-BmpFeIGVYAA3L

From: Eugene Loh <eugene.loh@oracle.com>

I confirmed in a run of the test suite that they are unused.

But I do not understand how any of the dof_ecbdesc_t fields are
used: dofe_probes, dofe_actions, or dofe_pad.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/dof.h      | 1 -
 include/dtrace/enabling.h | 1 -
 libdtrace/dt_dof.c        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/include/dtrace/dof.h b/include/dtrace/dof.h
index f5655fe2..f9b66e10 100644
--- a/include/dtrace/dof.h
+++ b/include/dtrace/dof.h
@@ -94,7 +94,6 @@ typedef struct dof_ecbdesc {
 	dof_secidx_t dofe_probes;	/* link to DOF_SECT_PROBEDESC */
 	dof_secidx_t dofe_actions;	/* link to DOF_SECT_ACTDESC */
 	uint32_t dofe_pad;		/* reserved for future use */
-	uint64_t dofe_uarg;		/* user-supplied library argument */
 } dof_ecbdesc_t;
 
 typedef struct dof_probedesc {
diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
index f1ec444c..55f67c03 100644
--- a/include/dtrace/enabling.h
+++ b/include/dtrace/enabling.h
@@ -53,7 +53,6 @@ typedef struct dtrace_actdesc {
 
 typedef struct dtrace_ecbdesc {
 	dtrace_probedesc_t dted_probe;		/* probe description */
-	uint64_t dted_uarg;			/* library argument */
 	int dted_refcnt;			/* reference count */
 } dtrace_ecbdesc_t;
 
diff --git a/libdtrace/dt_dof.c b/libdtrace/dt_dof.c
index be29f045..c89ad830 100644
--- a/libdtrace/dt_dof.c
+++ b/libdtrace/dt_dof.c
@@ -738,7 +738,6 @@ dtrace_dof_create(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t flags)
 		dofe.dofe_probes = probesec;
 		dofe.dofe_actions = actsec;
 		dofe.dofe_pad = 0;
-		dofe.dofe_uarg = edp->dted_uarg;
 
 		dof_add_lsect(ddo, &dofe, DOF_SECT_ECBDESC,
 		    sizeof(uint64_t), 0, 0, sizeof(dof_ecbdesc_t));
-- 
2.43.5

