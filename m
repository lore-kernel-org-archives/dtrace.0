Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16442DA765
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107792; cv=fail; b=CYIHzlg9b30vaaBW+nMoy1sfLp4o0BXKcrIpCnq4JxaqDxprrktU3Cf3DYmmW7AR2pysIHAaQAdaaTDH5fQHi63oPmjc4MdyFaueqqx7+y4LQn5ohhU8kyvJ/BjV78l3MlHO/GXXO989sVFvnIITh+JxCPFGUgIZ4jkJ/CidBA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107792; c=relaxed/simple;
	bh=MJ/lsPtSsuey7/ZRXvxk8xfRf2spqu3mQuZ93jDhmg0=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=oxzMn29UfsinaNFlQq5+hpJYrIWr9u2a66xxTKBh5URdDyfUUuPTG2fSy8zSaD4YA6Ydl7Vw2fR7HxD6CtxwLI1HzAw0BfC2ZPE7HQN+zL2GfOaVCMuIj38khMUaOEBhNUTk5zaD3lc3GUchfKL0qF8sB2inkL4KVKYNMWyUCak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H+zBuM/W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v++xMtKZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H+zBuM/W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v++xMtKZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCMmHQ029331
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 14:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8+exM1wiQzxsd+fJ6jmSW4WPVlOARu+a4N6nH9+yTGE=; b=
	H+zBuM/WcTP1MIz3+rdknVnUgch0OOiTP0UTA7XOiwZTQbicMI/D+H3dhiAhUtLk
	ceWyfhJZZGffllv5/GQ3wzk8ey8SgyeTqmKZtsJ+GblJgAesWZoRYZIt5220YmE9
	7dPCJKNM5c2L8zsn0785We1T4dMFVuvJKkPukOJQYmBFc7BsUMfBEap48dIL85+W
	+m0hr72DjYH5AENeCk/n+w9FScvdOat6IOm28OLnaIfQt1l7++OHyuAwCjG5HvDS
	U7oiqelN7+jUYD6kBM3XpO90KPiPaXMQgYXHWcImsMh9sOepD4Kfhec4BTjCYSKF
	I1mMSwGwkDXTKLyxfyTHKw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9ju5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 14:23:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCru3R010475
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 14:23:08 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t849c9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 14:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRDhuT2A1xiE75jZ5ONZIR1KjHkeWPujaZ2RQ8vGeA4N1PVW4CHoZWX68SflKc3pKw4HrHgh7e3tR156+aShf8qlU4wDS1Q2lKSWVcCdNzjeQup8FFW5EeZkhTv7Kf5iSg54Jf38DWCxdCeejjPwyyBUOm4Sl0dEErDDQlzKhn4gkbZEGYTuXpTX0yvswTO93vhCmRJMiqVSoLcXKxNXlsYP5nCyjXQ8m1K4+CVJVl7QrEK0k2I2ezXB8i1bdbhjF7ubpitWB68yZhgdPiYd0M61jSnwbyAza0f1HexHiKpq8oCQp2HcZyfAQSi11iMSQyjOI+h12Li8JZFviFAxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+exM1wiQzxsd+fJ6jmSW4WPVlOARu+a4N6nH9+yTGE=;
 b=JG9H8+y0UEytqKhBIBp+y/UB0LhKF9WuWc9BbYdOwS1zqWH09+YR7WHsuXZiYEPWbqYpLDKOyPp9TlWR9N9M8GqhlqPiGbmn7zTo4/OFN4IdOEvXayjxS7n93bAKMI400I99oVcAQFHqZZkodc6yoh9Ljwjag9H1yMZaRSoFP4sUqd+Pq1UGzkRarmHD7COEFa26axfGBVXTRp+8bDs2hb+bXPxwSvB9huphOZqG3TSZCq61u/hxFIqStW+G/C7+XeZ6KG5qi86wPST92IBKtZA23E6m5yq41vuDdK1RLbMdWM12n3SVS96/ME4xcQK2mIhe/5bIj5mSyYSClAjYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+exM1wiQzxsd+fJ6jmSW4WPVlOARu+a4N6nH9+yTGE=;
 b=v++xMtKZc9kChH4Z3feZiAValD2A/S/Dla/K9l4p6RNL9ac8t6DLl1fdKtiNKmNCVcA4uwrFQ4GChDih6o5++ucEjlfE7ctlodouPJPDnv5tMxsIpNNqTRTJ5gk1MBXu+bnasZnT29ENB/+cb3j3++z6DQ9hOxDEjIBSXjK0vJo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ2PR10MB7084.namprd10.prod.outlook.com (2603:10b6:a03:4c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:23:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 14:23:05 +0000
Date: Mon, 21 Jul 2025 10:23:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Outstanding patches
Message-ID: <aH5NR05DDG9baQNF@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ2PR10MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bba03f9-56c1-4613-16bf-08ddc8621bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0sOIMWDWr020dJh46m7sxAkcHYHYhoxVpTd013cmlGUSFnQ1yNquW1+wlHUB?=
 =?us-ascii?Q?WZ/VxICuY/V94X6N6xs8n7WS5mZDLFzHwh5te/DwQSW10DTdE5vNjfiXwmpA?=
 =?us-ascii?Q?JVW5tbixTyhMo5C4GC0lv4IlEeEulxJlM/5TSdHpFsU0uHsdfRhM/By4zvvW?=
 =?us-ascii?Q?Us/CRkJS1i5AVEC2X69NSwyqsQ0df3UqN2otR0sInaXYfcozpo1H0oZFQpK/?=
 =?us-ascii?Q?its8fWZjirtIlYvXs/FNH8cPKHj8gCULFpIO+HXHGKix4WqUoiynmrKnVqZi?=
 =?us-ascii?Q?JEMJ8AJnKuMjlODzbRJBgMC06h3oqFlDhmcwpbhIh1V80uG1dBrmZGQ03wUW?=
 =?us-ascii?Q?qxR6Z6Ug+nDMrYsQB/C2K7Vqk4kVM4KxbDCEmMuTbReWBzIbwuJZuwLkApHh?=
 =?us-ascii?Q?3rTo1ogrKQJebqwHqXhcmTLG1FFeDZ+CjoCMOHSm1Qsy8ZfHFpANG93nqZu+?=
 =?us-ascii?Q?YEMS2tL+dKPDeDDhC9x/Pqv+6VUjQQznAACSlBPbvVFQjtBlI7Ys4uryfuKL?=
 =?us-ascii?Q?nP23Z3FWctjvacK6trXyonScGRqvBPAi8OdxbitTlgiYsyyHzKIrfyEgzQk0?=
 =?us-ascii?Q?FmoRzYlaKDU2OznuNvAyMBPKY9AUG6wek7Rw8rcAbS7nC+envOTiVKqoLuBp?=
 =?us-ascii?Q?rpTxqPZOdpcgS4ULmJBgYE1tUl1K7e3fF4/Yz1/S+OvSufRLMkRS+yqJXQ9H?=
 =?us-ascii?Q?NkSrAr8FngGfaDIn1ma7MZ6q+Js4TIzgiUdq/glMQ7dRAsHNd4pjmUb3S7rv?=
 =?us-ascii?Q?yt3P2N2z5R6Fc3Pf9zyPsBhYJbCvtpEjjhYLjHClvInxixddyUu3i5YFclHU?=
 =?us-ascii?Q?p4uYkfPo7E4LHmXrrDoZbKLBCJ2vlGH5JPd8aT3p2MoXoi2FYPPm2exZvyRj?=
 =?us-ascii?Q?9gtd5ixbc6gyBKTS83OKdRjXSeSypQFpd52BfmBOZMBLi8n9dWsh+y7YYOKf?=
 =?us-ascii?Q?1UjLnX8ozcr7mf/EXiO4IZBDdjs+fA97KljNMabW0zsGuLInTUsngTc1onZ9?=
 =?us-ascii?Q?d5rxPHTeKITe09wZojlpWY13htPA8cYN4a0RxyA5sD2sSjQhuW/EvkN3CT0U?=
 =?us-ascii?Q?9GB03ces1ceRJ+p10b6KLGMvj9uPA2KoYDUterYKR7oWFYrcoLOdGy93q41Y?=
 =?us-ascii?Q?6NpSvgf3rBpa6znZzBxNMB1HW6pRDc+f5noe+whhUB6QEgF8VzVYxQp73fcr?=
 =?us-ascii?Q?4nX5szAnakZuU04jx8PQEnKFIpxIG5kuYsw1r5q5ESFPpCvy/NDUSUQHjsLI?=
 =?us-ascii?Q?wB7dzNGSN4T9KFvOjVcF00gDlWpwAlPhZ0DXIrv7obKnHNyc+s2BtVdFzw1a?=
 =?us-ascii?Q?m4l9ZSYPM/TrW4iLlXZtwJTodgH0a1QPifINBFal+eM1aoag0vvk2jUBFqdw?=
 =?us-ascii?Q?EDIN2ZA8/xt2jGPQHjWOH22h4JCTEe6A5DIRl831hGHIDQ9QBxlJF2+4Fr0w?=
 =?us-ascii?Q?DRNbtmJaaL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XkxXWluFYYwf0jugIqsK9IP3jxKzXFKUL3ZOc5Mrp3tCldLSNHpo9o6rz37s?=
 =?us-ascii?Q?iLZwUlMvklEM9NHwcv3y9poKpWvjLseYXv2QmknrhaAnYgJA5wC6PiFAqdJO?=
 =?us-ascii?Q?Yw9NwHZ8D2ZabR0mVAGodCI/pDrSLtHIJWOxUXMtbItSGglkkGcflo5otjsI?=
 =?us-ascii?Q?lvjwyScBShb1UE6gPbm53W/yrGqV3ojjAHQ98pT11NO4RRSLXtGldCUvN4Oe?=
 =?us-ascii?Q?awIR0C+mD+KaUQLiSZPmxOSwwPL64fpoo9g+A/MC1ca0DzTa1rK85bJmbURT?=
 =?us-ascii?Q?j6B2FXgx0wbefFwJiEXGMBDpPqYuB7qYq1bO1bliUJEN8qY4FRd86W5SUq2d?=
 =?us-ascii?Q?9LODL8aSWLV53tDv5fG+xl27KN/mjNXM+j8yWPbfAShawWLrVBJTlCokAsBp?=
 =?us-ascii?Q?KFwqwg0y/aeDZUvlVp3AutXoTpBHdehwYZqSQGfpl2UTm6QRQ26kU+tZ8fAK?=
 =?us-ascii?Q?m/jTngMmEDtqn+gFQC/86s51gzcKOpnm3lfvvTtwprxLHNaqVdrY0/wZq+uC?=
 =?us-ascii?Q?JAVR45yfiyKH6t/SC+p0lgrDiBw5q5NlzE1UhefLbGZnhcKyWOn9XQ9Q6FII?=
 =?us-ascii?Q?/SyRGVxjc8UpEE4pLxB1MI2Kq8JBdV3NXHfCc2RqyyT980ysHYLemj9ws4+d?=
 =?us-ascii?Q?gxEgb3ea4D6JFoUvLEe1r+FfGJmc3otu9nblDcCa2yQR/zDa6IXzqG3UWPOP?=
 =?us-ascii?Q?v+5r6EXuxAFeJoRiQTONJqELqoMF8gGnUZB/oB3anKlbfxvcf4+Z1+9bOA/G?=
 =?us-ascii?Q?5vIl84824rkz31Mi6Z6SX7f5TBxE5a12iF3G8zc2BPhqFKMlKN2WeqFtcG6i?=
 =?us-ascii?Q?quEIR3GZvXX/MlwSeURlbxZLPgWCeN4k+4paWrp9W+Sv83KDptoojqJI27BL?=
 =?us-ascii?Q?PvT+EPJNoZzziTOqhESzXWjf+dhnxzq2nC6BPULLos3PqvBWk5bnA3qrzbM0?=
 =?us-ascii?Q?apuaIdo1Z9pQbkBkusX5yhd07JJab84upsPVm+usRdeXBzQn/KPnq9pwbrd7?=
 =?us-ascii?Q?rNcE1b9JwweZi/5lWCrcT30UX4rAMVQYzZ/Ig45sgOi252LVSG3r35Al7G+P?=
 =?us-ascii?Q?BSmFeGQtoWvbYQPJORtk2nM+zO1ZMaJ2SLbEoMl8QE+7reM1aOjHE78gIlu2?=
 =?us-ascii?Q?JvkgWstmjvwi7fTJIE/cGC5tflmcnkEUJmYAczSo7Xvq2WEJ8HJSsXYJfZhG?=
 =?us-ascii?Q?n+rUK3B0J2XNtlFzZE7E7YUjCIkfae4WZFWtZD1DX/inlttLsTGaa3owpJG9?=
 =?us-ascii?Q?YALknC6PsN5GxEXqafGsuG0VL40NckSRoLxhB8teGCSiRa6RuheIvjdSmSJD?=
 =?us-ascii?Q?KUBOLVWrAFRjNAPr9V34dnrW8R4O4zet0AygchflFCccQpXO2y1prlmdn5HF?=
 =?us-ascii?Q?9IrScFuLv6UWfSceRJSEA1zmDUl5QgQdlZE2hZqS4P3CP/YnR50RKa1E2jXf?=
 =?us-ascii?Q?/aYaBkW2NSZUxCalu431ZbY6qr9HxRXjwY/1WfEE473L+0ziKIfqZwCCc/0K?=
 =?us-ascii?Q?XiTxLzYQ3UDyak+Vza+GLJZ4P0nkvi7zBD6/SbTeRzJAe9om8uoUIb2/D7iR?=
 =?us-ascii?Q?qa4YgKxgos2Jt8KBF/cKlwL4XSBZRqIkBNsBoru2AANQa5j76qVJAhA6jBCI?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+0TpDd7WSElFMsnz9KVhTNNsC8rjvZGe96bkk26NO82i/DBPjCCBaqqfhpHGfl+3+Ocmx/UG8n81nbsnfXbO8tgpclwVe4qNvUHfoJ6iC5JUGNVvgnumG5P3E13NYRjabObvwbF8jniqkMEMlGfrnguotZ83SscbjlfKtNhVvRUSFghZkTQ/82yGdjtShWvHAefaVbNsAnMCDW6yBjg9XjhPHyABugbBT6dTP8QBEV0nC0x/84ODDaU4gF1p/QnuA+eIUJaxr4euLCKhuwE2a8XoV9180P4y5m1rLW8u+AuV7xnaivnqGu9f4gYCpvCPWZOjYNcChYiSliFUKQ8gFPCfg7FIs3RtTfujmYoo3Kg1cPTRkpqBRJNaKNd8EXCjBSyF6Rqx0HrgdGiSU3vNgNqQ0EEm009SEwIPCOQhWdZZAWYZReMdGnP5CnvW7S5iSfDuH01296kBSXfZlR6rZ8oVvliVM8URubHDqMbBFGTXjCJO+gkHkFk9ZTIYXkPUiyNwGTj55KUpRKIzDe5vOJJuqmNyu3Ee0HBLw+9ELiEF6rlnLa2QC7zcTe605iVmabE+9/hvJREDT7COquicWDYpW+cYcdwCk7IBYq4HXVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bba03f9-56c1-4613-16bf-08ddc8621bd8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:23:05.6978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaF6pguamwbetBbBAJFBQtPdDb90ugYqQCh+y1vMDTxrmKcmSD253t7N50mZypSH8Sxvd6ANr+XlMSXyg3WyA3ut3lDGdUM1Zb05usXEw50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7084
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210127
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687e4d4d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=wo0wPpZf16EliCKx6ssA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: a18y85Kfg_Lls3SHGJ2D4XyUeQbE8v4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyOCBTYWx0ZWRfX1YT1AR6qGBN6
 7Hj8kEQ9XOcbwLfM5j4jNbmsCeQs1KGqyEjr5tib2qTzYRY2eGXNxPlYfr4av4X9Rpirg7JOvqZ
 NPai2KbHAvg3PJDJjifFyoV9wYKFXW8P9+viWvHsIoN+stykLL+TxRGgORKK5r7MpPXLpSDx06Q
 G1vRtwyKlzknvzZ9yPEn6McEXLB8poBx3HhTvMAFrb8hTpKuWi12rYhtj5WFJE7OKDz2Sgw41iM
 UE9oIOG6BzjvTSf/8G6oWrbvaP8otcxlIr3JwA/dRdFnRuA/C4dIl9pR838vsi8Ml1Fyw4+Dmvw
 XtKWf4XvQvDLqeu1ibzQGGFGqR/YQYBGRi3ZyNHJdEYPRwCQQkS2T2WMiTigsd7Z71OW+zcKRnj
 ZzNoh8P6GQEbfVt0EOIyzN26Pb1PrV41YC3aT2xMF0d/h/dCnTtuYZ8NdtsXL5SEq5t3YzgZ
X-Proofpoint-ORIG-GUID: a18y85Kfg_Lls3SHGJ2D4XyUeQbE8v4O

20240212 NA     tests, actions: fix tst.symmod.sh [2/2]
20240604 EL     Reduce stack depth if kernel returns NULL frames [2/8]
20241004 EL     test: Do not depend on ext4 [4/4]
20241106 NA  [REVIEWED by EL] Allow arbitrary tracefs mount points
20241107 EL     Optimize USDT discovery a little
20250208 EL     Eliminate DT_VERS_LATEST [2/4]
20250208 EL  [REVIEWED by KVH] test: Add test for predefined preprocessor definitions [4/4]
20250208 EL     Sync up the version numbers [3/4]
20250219 EL     Extend the USDT bit mask to multiple words [2/2]
20250227 KVH    Refactor the versioning handling system
20250325 EL     Pad strings in the output buffer with NUL bytes after terminating byte [4/4]
20250325 EL     test: Skip trace() of a 1-byte struct [2/4]
20250325 EL     test: Update some char-array results files [3/4]
20250501 EL  [REVIEWED by NA] Cache per-CPU agg map IDs [1/3]
20250501 EL  [REVIEWED by NA] Remove unused map-of-maps functions [5/3]
20250501 EL  [REVIEWED by NA] test: Convert tick-* probes to ioctl:entry for tst.trunc.d [2/3]
20250501 EL  [REVIEWED by NA] test: Mimic dtrace arithmetic more closely for avg/stddev [3/3]
20250527 EL     Snapshot aggregations just in time [2/2]
20250603 EL     Omit an aggregation record if translation fails [1/2]
20250603 EL  [REVIEWED by NA] test: Make the USDT "only enabled" test more stringent
20250608 EL     test: Wait for output to flush out in enable_pid
20250609 EL     test: Suppress some white space
20250610 AM     dt_impl: bump number of TSLOTS to 8 [2/4]
20250610 AM     dtrace: add tcp provider [3/4]
20250610 AM     dtrace: sync dlibs with tcp.d, ip.d and net.d changes [4/4]
20250610 AM  [REVIEWED by EL] dtrace: move get_member() to dt_cg.c [1/4]
20250610 EL     No uprobes on ARM autiasp instructions
20250613 NA  [REVIEWED by EL] libproc: make Psystem_daemon() detect modern systemd properly
20250625 EL     test: Extend timeout for many-pids test
20250627 EL     Make sure all probes are listed in default case
20250703 AM  [REVIEWED by EL] test/utils: add more reliable "get remote address" approach
20250708 EL     test: Skip err.Z_no-w for now
20250709 AM     cg: bump number of TSLOTS to 6 [2/7]
20250709 AM     dlibs: sync ip.d, net.d and tcp.d [6/7]
20250709 AM     providers: move network-generic definitions to net.d [4/7]
20250709 AM  [REVIEWED by EL] cg: move get_member() to dt_cg.c [1/7]
20250709 AM     tcp: new provider [5/7]
20250709 AM     test/operators: extend ternary tests to cover inet_ntoa*()s [3/7]
20250709 AM     unittest/tcp: update test.x [7/7]
20250710 AM     selftests/usdt: add test covering different forms of stapsdt note args [5/6]
20250710 AM     selftests/usdt: add test for stapsdt note-defined probe firing, args [3/6]
20250710 AM     selftests/usdt: add test for stapsdt note-defined probe firing in -fPIE binary [6/6]
20250710 AM     selftests/usdt: add test for stapsdt notes in shared library [4/6]
20250710 AM     support stapsdt ELF-note-defined static probes [2/6]
20250710 AM     usdt: have copy_args() count args while parsing them [1/6]
20250711 EL  [REVIEWED by NA] Need -w for destructive actions, even if clause is not used
20250715 EL     test
20250715 KVH [REVIEWED by EL] cg: optimize ternary expressions for strings [3/3]
20250715 KVH [REVIEWED by EL] cg: validate tstring alloc/free [2/3]
20250715 KVH [REVIEWED by EL] parser: add dt_node_is_tstring() [1/3]
20250715 KVH [REVIEWED by NA] provider, cg: add reject_clasue() callback [2/4]
20250717 KVH [REVIEWED by EL] tstring: fix leaks
20250721 KVH    dlibs: use explicit vmlinux`major_names [1/3]
20250721 KVH    test: change .r.p files from /bin/sh to /bin/bash [2/3]
20250721 KVH    test: sdt:task::task_rename takes only 4 args on newer kernels [3/3]
