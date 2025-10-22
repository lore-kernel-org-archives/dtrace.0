Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49F1263F36
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103410; cv=fail; b=InRiXc4BoRKtB7ymQcoWakL5DK6PQAghw2+Mg6eXij6cjZcrvYt07L8EDGnPxUTJT0DX9JZcWvR9825Gup+Chr0Zp7a+0kF0DJkxz5PzjeI6/DQsscKKRxroSZSUNA1Q3tLjFxiXmghfG93VXdzkA/UlJmN5esqqjfu5oIwTTSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103410; c=relaxed/simple;
	bh=d+vx4p7+WXWjSgqxixhisq2X75t4YSMN1r472eR044w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oHRX4lfgLlWJjTf5rO00B85S6+3rRFSW4FyxDnFHMa20EYIm0Bhm6GqPXYvwM+0/+xbdtkBIraRGFJ6ImzY5yA6uzoocFdD2ZDMpxQ8smo9WH60iK4jOhpYbwBkj9tsUuMU6t60qAf27Th9dDjvxscPU2ejwVqwrWNZepbjZAkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ApTa6TwT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k2EvcQD+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ApTa6TwT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k2EvcQD+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NRJf022551
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WJrPytOkzM+FPGbvpd
	VBHmNOA5nAfjpU1bkncXShsA4=; b=ApTa6TwTwGysgy8OPejf+QpTchzHgZm7q0
	TvDSvT/nTLBz/zv3fQRc4cKNFzUfOVKePepssFMJl5ftYLWQAhEsZSQeRv7EZrDw
	vykM8p5LcU1JHPtP1hIqPl0fhg5NXic02oB7eeQNnmrRsQ4RbXehKt/8xnm0sFjn
	CwyUNrj0pFtThNGEbN0nLxObLc1d+2wB0qN5A3OYV3dhKRSZucQgvZ3Q4LtcbEqp
	6U06lx7leov5qSnCE2rED96p74dSb3rtM1jceH10RLHJ5JXZUWeW/Ees3NNZqzrD
	/VQjL6XdiwFAMJIg8BivLnuSBYckdOsZcIN62P+KpYoc97/SX1WQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2vvxtn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBk025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:23 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttsGMLevL584YNB4AZrtKUCYPQKozLHlDl/c/+hrsxj7mlWwLhaKXp5O6qeNr291/bX655bMCTqAFOKRM50e6WLN1VLdboYPdNEOUfFfEUdzz8ncrMgMkmn35oghr5m4DQ8TXVgq5wZzeMzYxoXGW752rYc3UDjrQ0THhwvtLfpqBALWEjVgkU5ahgdpsFdWGZPylkL40G/mCUjgl4HWlTFPBlG8CDCz8bhsv+QDm2RWQP/IRsMDgGb8O8ntMWqqMws4DNqJmv3dcmyCGppgchWLTprs4AQsStdwdLPJW6X3qVKuA7cKRwuTg3y+xmxutbQLJnebPUKTDZZg4uTjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJrPytOkzM+FPGbvpdVBHmNOA5nAfjpU1bkncXShsA4=;
 b=HhbNE29LgsrDz0Ay1BqIVRNSwgnWiyNOCQcHqC4l3pX6DlabmIEYMyG8Yr/GZI7lIJRn/aykeVYXivp3zx1FwzFlkSfUt6WaQNWUB1TATGsT2dOyESdOGtxj2SdQVqM0a+ugz9z1kpFQijU3ydxJW4LXTTQQqDFn7lDNSQwKiDdVosEqz+6jQyjFsOFZpjfVwXfc+Y8zZA8Y0ecrUdAxCLJwycU4NeFrzlAsLt+J2wgkPNW20E9eJwynDR1Um0hOgAoXhsaxO4WDOI5xCQ0j90dy4cf0YH0Av95kk8e1xJbuy4XA0JmpmU9avjIhrkGUjPumZhyNwRyEBn4HIN41SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJrPytOkzM+FPGbvpdVBHmNOA5nAfjpU1bkncXShsA4=;
 b=k2EvcQD+we5epKshEg+I02t/CXH5YyJrkHRirGom936Qyf2BNaCURt/V0DenA1PH34lXX12MU8c3xzpdruARYoAjaxw02ps9Pb41EkBy1LnRYFZmDHA/IpbSqAnACaxWL1Il1qVRCau7SgWQ119wRPkUQWQPw8WUTfqDMUjU+ng=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:01 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 10/20] doc: Fix anchor links for explanation/
Date: Tue, 21 Oct 2025 23:22:40 -0400
Message-Id: <20251022032251.2010-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A6.namprd05.prod.outlook.com
 (2603:10b6:518:1::55) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3fccb5-90e9-4101-0db9-08de111a4e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B5Vhn1wuThAZdEUo06yxdUcTO8591DOQGDnzOvr9T/VzAcAJyHngPKEY/R9R?=
 =?us-ascii?Q?wAD/6ESGt++XiyoLUOK/+gfkZnrVizITrOVa+4gTDq/tTdd6cd6eWCCZJiSD?=
 =?us-ascii?Q?qXcA4/ooKIa1MY+q9gYoKWeFZdQZyx7G81xWfrbCQu9E0FoYw9+mzYCJ0hN5?=
 =?us-ascii?Q?ha6GasAKQFmm1rEsU4bd1vH71GOR/AlZji5QmgX9ymSNr4HpmMTxqAjkr2Yf?=
 =?us-ascii?Q?gHOAse6AgPwXCp88zCnGXvB4BdaKRZcRPK8OV92ZFFu9bWU4YEBgV/EfLRCw?=
 =?us-ascii?Q?lp2d7YQBTl6PNkZQas7JcUgv6D/nZOBfZ0/uai0GEVkOmokYwDJwJaWAO5Qo?=
 =?us-ascii?Q?mEkSfzJ8W2O8H/+gd24BvMt0B+T1AOawx7GwAhOM1gvdn4M+MVq8b85Bgft9?=
 =?us-ascii?Q?GIwn8ONDXE2PMDL3oGZc5Uf1bF4gGjywPNrEKfyjRYhQy4cNwUJP5Arc7Fdp?=
 =?us-ascii?Q?hkLqfDuZpnWXnFJGGl48bcFB7PUToTbMOgM1xOKjax+OlLzaTLIbY/FZ4avV?=
 =?us-ascii?Q?M1ydcI5h4JsO2Px5EsGfCu+4AYEh61DF6C1wlWkAkTjXgWxQtbW3T5zhRsRy?=
 =?us-ascii?Q?zK0TMvTnhyqqVVz4m/cPvj/lWq8waGxE3xgxCKpeLeBlzGep+UxTl50+st7f?=
 =?us-ascii?Q?wqkzigQltmS61DRvbvTrV5Hc9xtt0xaS98uF/9ZsEapPGiPTKQWuXC2Aq7bE?=
 =?us-ascii?Q?HkSA4FpePXqRYpSLAGXGSG76AGBH09Px6X6eBb0ZVv8U5yBMJii4PbNAuzfF?=
 =?us-ascii?Q?xKt0sYmMWvuN4mqfKacSQmzQuIy52fqHULs1znL5A4MWZvWXM3yFZm3rdTRY?=
 =?us-ascii?Q?sreuIZHhwwwvCyjsQ4w5KgY7wyzyZFS9HZ4VuTfr/GVvURLdI+B6ad4BhdSY?=
 =?us-ascii?Q?lG0OEnZa66dEqY3rwgRlxALyySAqRH0inatqfFPkgHANh340+sntEX/ZdYaa?=
 =?us-ascii?Q?4E35MAqyUngk4NEDnq64GxZTzwxSvnfKhHK/JrVt8W1f/s4xBmFEWlzf/KVK?=
 =?us-ascii?Q?55DdjtZju4+kfrrFw3uh1187pwFNyJFFGv+CP6Zh9lgcb6nrkkNcu/SzpBYR?=
 =?us-ascii?Q?oYHV8G7GW28/cceFXjhWqSKNffDbst8hQcqkflTuPFFK9yumkbpqxwgkV6Jc?=
 =?us-ascii?Q?f3SV7FxgTXYc7P8tL3F8B69wCg622EiP3Ji1Kfku3xGotqNhIHWdIj/ei3nW?=
 =?us-ascii?Q?yDZ/CCBWYBlDtEZ0NyD320G4XnCXx2VNbvopUNv6ZAHdBHeZ6PzpNOJcOhFH?=
 =?us-ascii?Q?HP09rqzsW6pwaU+2PxBa5ORO0dcS52dY/6s4QPvaiSSW4LJhAkcXMhx61i8l?=
 =?us-ascii?Q?R4MHZXQTEUuJJYW1F206vBzTRp9jp0o5QzmSCobzXy04cVYi299L92eiY3CT?=
 =?us-ascii?Q?EEWRVkqhOxfpLXrOOzBIleUSvzP9Oo/yHJQYR/nY9TucobQGRHvL3F2orgoN?=
 =?us-ascii?Q?LGd1epKTrHxe6kt9UBBDH7nFXuR/9aaK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ie90Z+ECoqQcatDr9oIu14l686vfLH2aXdijTs559t8hv1rmR4x0o2eZ+Bu?=
 =?us-ascii?Q?Utvgo6MDvCVObh0Jc9yl/0Qqh/Jn26rSTdU0573FKHymFrGdhj1REqwKPvAs?=
 =?us-ascii?Q?9przwwrbRGQTJdpTuDjfRUHXFJX5mcWJsAnHq3zmQImqcmmwgspo+g7Syp+F?=
 =?us-ascii?Q?aaTFUkDesge7dnTiyFJCeW1TE87Gho4qZzR8+avraI5/AdFN4V19OOcfyfev?=
 =?us-ascii?Q?1mZnz1TzqpUOja3lqacKAKuCJmS6xfuztH5Nm63wgvpA30ip8WDRBSgAfFxS?=
 =?us-ascii?Q?mzSdg8Qns4Hm5/zsjn1fZx7STHZiya8vGXvlhXZkTXaUkzYHcg26du5TTk2Q?=
 =?us-ascii?Q?04fkUns26qTWicnHCDfWIGp0xSq16LYOmgcLiJvPoCoWqI3o0GGJ6NWs9V5G?=
 =?us-ascii?Q?lfgOP8JZXTEz7tkD87IWBJY7cpAB7XC7Hv3vu25sN/+3kc22LozKSPXr/iXn?=
 =?us-ascii?Q?c8sn3HZfjJBvsCuM937KKiiHELWeW9Pr/p6f/+mttebdjwT1z1kXpxzPIgIA?=
 =?us-ascii?Q?ueE041dPuI4uBrVZuTBGi20jspNSPVgLED03ZFLgIGZS8zy06s78VhLEUlBM?=
 =?us-ascii?Q?vDZnXXQHBIkzSFf125e1qTj5Hnhp6RRXM8m+wWMXqGsD/yCNV4n7aB/enIq0?=
 =?us-ascii?Q?JnBdPzfYm2mzFJ6CaBA1v5goXrZA9SQ8onXFE6oBXHFRAez/8rfWFd/knDFs?=
 =?us-ascii?Q?RzEA46OTddjiQtbvPqUZdqdxlxmHgUCIrzP9w70OglkM9tlB8I5bOXlMiQVD?=
 =?us-ascii?Q?3zaJsHZHv9j2fhnIiMuLL/OKzlGm9btD49g9q3uiV90HLKMFstq+OkwHiC8d?=
 =?us-ascii?Q?sTu22V7rRvmmpVYTEcItaDIFV5ZpToQQStJSjCD2ZBK5KXbDz3GbisdF9/VD?=
 =?us-ascii?Q?LNYM3ZHsNPi0wEDQqey2YJNBl7GTqreadal0hOUVMDFh2yXW+XR2ZT8g6i0i?=
 =?us-ascii?Q?D0IgOVbzPJuGCdl+TuQWVEp2/xbkkaNBQOvD1wT9W3GVgsXD0B7q02zFQmPR?=
 =?us-ascii?Q?+AsPtq1RiGbSEJOW5oifOwyNJEhReGUN06T4uoxk5PBa0yBUDIa7XW5TpUHN?=
 =?us-ascii?Q?wjvBWB+2qGSl3bI040yCskpypEOGWCGi1E3+qmXv3LKlPuTyTeTbAtUCelvi?=
 =?us-ascii?Q?HUOpJDO2GIOo3XO0DwvfmYCTzr5rltVs9PT4Jh0J4/nU1e9VS9SxFtB1HB2I?=
 =?us-ascii?Q?B7WQ3+LRgetaD8d5GKu37kDzFzMigk+7evbahnsR40d/O9oyT0II39ojLenj?=
 =?us-ascii?Q?CtGTOdmDu2Inb0bcGNnLzKJXP3jlf4KyEgLV5B4gyiZWChvn/lv6iecybayn?=
 =?us-ascii?Q?LUxIU+qFg7u2BtTUKVlcM70FLBLt4XFasHX4MoeJJAwC3LHX0INtgoeoleJa?=
 =?us-ascii?Q?KgIwvYhBhI4vHFQ2GSfXbVHyiZEc45RpreeIJAezN51mhkwX2CGqK9ouG2l3?=
 =?us-ascii?Q?cSmras46GgPNTVOrCp2uLpSw8KqGpoPKBoqPUukMFvnPYb3nZLX1kPbbutQM?=
 =?us-ascii?Q?Eomgs3Q3iKq0yMHSCtvp0pi6AsR13KReBMAivOz3ABn0BVw0LaQzjFlQoDQ4?=
 =?us-ascii?Q?NKe+bPHbqk/r/1Sh1ERhXsTex0dDJyg9+qWdcvNp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tZ742oybSmT/Ba4pMgSmZ8kvw4LtbVsP1RzLe0C8NpRSTF59erW3Pp12zzYre88Q8wnP0Kmll1LWyPRFTVN6q/3LPXP0yDAjuA2s5kjp43q1dBkrcPUdYgvG+B0jjNcugB5A8G98ItSOPB9dSnoI3ac1BlB0vofLmLrWU0gv9GQ9yc3xzfYc4X+5e2t48mVIgjrrXHsxmG/aIeC9myXo/+Z5aXWDlRjlRh6C8uWnViwRD6fnbYup4mZ8hqFZmaAzorJbafsfBca6uYI3PET3i0jlsWpB5i+9P8RSTAeFbcdoXnZrGlo5Xyjpn0gpHoGuwMi+eOQDJpR+KsW3nUaV8YBYlNr/SgxEf8GxqKJT4BY1F4JsKOwv+WBUFd/MnimkDOqzFriMoGu6uFyv0ygxXxZf4xe4TqaP4I3vQD4mR8NxMJfB1VPnqN8yW/1bQUKGWm15E3J93bM75JcxTR3A0Q8oB4g1wuoV9XMpUNkH4uqtdRtHMy9M5yhnB0fdG7d74jdTpQAYd36r3RPXDH3pyDiNb9Tq0x1iUijSdgpnPqXv3UVfQpTqA0ESA4NzV3HEBSKT8pWdR/Mj/HsuzNWsJW/NUBtzMeVKl1ZW6zFANK4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3fccb5-90e9-4101-0db9-08de111a4e6c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:01.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vzqad7w4dTxMEVyxJgRL478tbVoV69o161Fw65PLToEyBtgmWQMYrdvx+ctZLQNd2sejjVqUCNMDRN7WfA0ZZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX9tJ8dgbke+IZ
 C59zTNJnxxbb/CjEEWgtF4U/jdaJVSOWCyHHrnDDmIsj0qjMNqEfcKVcwsuvDsdB/DEPCAVxYeS
 lFKPddiOLgtnwrrAEBZ04kW+DJuQAcx3RykBpWS5pPswJO51YWWRjyxaWGNYtZhcs3hsFq0T94E
 oUoBosvt3llr0jj1yCmOIC+bHTM+EvIBSwUB4T5fwHjMC3S2PdPoLTWYhsM8ga8/9ncGAKpWqHa
 kpp+SPfUBhtNZ0VqKKQmbbS5V/sdiO3SymXnKg7giJOeJgLZqYwVOUbZMg8mbIQjOb6k9oaqmhn
 F3XoFS0LcGIPs25BHq8xf7j07R9wxHHouzA5Z9LJEl6iE7e20XvvEuUdUZ++sTxbd5UsJM3N3nT
 AEKFCwKekv7YTBojJFDGDVc+iR8nhA==
X-Proofpoint-ORIG-GUID: gahAVRWZSDS3JFdCRXpu0ktetjsXFugP
X-Proofpoint-GUID: gahAVRWZSDS3JFdCRXpu0ktetjsXFugP
X-Authority-Analysis: v=2.4 cv=FuwIPmrq c=1 sm=1 tr=0 ts=68f84e2d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=LJgdDvRoxDd0BoBiPIEA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/explanation/dtrace-about.md              |  2 +-
 .../explanation/dtrace-components-and-terminology.md   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/doc/userguide/explanation/dtrace-about.md b/doc/userguide/explanation/dtrace-about.md
index 4ab252a79..b832799e4 100644
--- a/doc/userguide/explanation/dtrace-about.md
+++ b/doc/userguide/explanation/dtrace-about.md
@@ -1,5 +1,5 @@
 
-# About DTrace {#concept_about}
+# About DTrace <a id="concept_about">
 
 DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
 
diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
index b187055a4..9d08928ac 100644
--- a/doc/userguide/explanation/dtrace-components-and-terminology.md
+++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
@@ -1,5 +1,5 @@
 
-# DTrace Components and Terminology {#concept_terms}
+# DTrace Components and Terminology <a id="concept_terms">
 
 Learn about the different components and the terms used to describe them within the DTrace framework.
 
@@ -7,7 +7,7 @@ DTrace is a framework that dynamically traces data into buffers that are read by
 
 **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
 
-## Probes {#concept_terms_probes}
+## Probes <a id="concept_terms_probes">
 
 DTrace works by using *probes* that identify particular instrumentation in the kernel or within a user space application, or which can be used to identify interval counters or performance event counters. Events such as when particular code is run or when a specific counter is incremented cause a probe to fire and DTrace can perform functions that are bound to the event in a program or script. For example, a probe can fire when a particular file is opened and a DTrace program can print information related to the event that can be useful for debugging or resolving an issue. Equally, at the moment that DTrace starts or ends any tracing activity, the `BEGIN` and `END` probes dedicated to these actions always fire.
 
@@ -66,7 +66,7 @@ dtrace:::BEGIN
 
 Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
 
-## D Programs {#concept_terms_programs}
+## D Programs <a id="concept_terms_programs">
 
 You can bind a set of processing instructions called statements to one or more DTrace probes, so that when a probe fires, the specified statements are run to perform some required functionality. The set of enabled probes, the statements, and any conditions that might be evaluated when the probe fires, can all be collated into a *D program*.
 
@@ -102,7 +102,7 @@ Wed 22 Feb 11:54:51 GMT 2023
 
 The program probe description matches all system call functions at the entry point. The program predicate evaluates a *built-in variable*, `execname`, against a string using an operator. The clause includes an *aggregation*, `@reads`, that's used to gather data about the firing probe. In this case, the aggregation stores a counter that increments every time the probe fires and the predicate resolves. The counter is implemented by the `count()` *function* and stores count values for each system call probe function. See [D Program Syntax Reference](../reference/d_program_syntax_reference.md) for more information on program structure and syntax.
 
-## Aggregations {#concept_terms_aggregations}
+## Aggregations <a id="concept_terms_aggregations">
 
 *Aggregations* can be used to reduce large bodies of data to smaller, meaningful statistical metrics. Many common functions that are used to understand a set of data are aggregating functions. These functions include the following:
 
@@ -121,7 +121,7 @@ Although you could code an application to calculate an aggregation for a set of
 
 DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md) for more information.
 
-## Speculation {#concept_terms_speculation}
+## Speculation <a id="concept_terms_speculation">
 
 While predicates can be used to filter out uninteresting events, they're only useful if you already know which events you need to filter. Because DTrace is often used to help debug particular system behaviors, DTrace includes a set of *speculation* functions that can be used to trace data speculatively.
 
-- 
2.47.3

