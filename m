Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100521CDFC2
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 19:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728590075; cv=fail; b=nmjmOFvx+i1BrF+HYyu8HWkNPtmrPfz49SExSXtyR4eMDk9EZ1NojiBy4AJQMuFIhEAzwYk4LVY75RM5qdnK06BBxfx4LdpmkF8BKSP+RH9fhYIuwJJW39i9an1kEBzhZDhncbdcwSFV6IMHm4hh8icDZV0yzMoy/Hy5qgIl2GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728590075; c=relaxed/simple;
	bh=RSKpdw3eOT0TG1U1XPGwDjwiwidnnFeMx5wgoeCbEQc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=gEX7TEc5wz5uXTnidqk1RispwK3ztUnH480ynFkXvlW4UkkFFxG1mP68LYREFJy6H6+SleYqqT4IUWY7ZwTIv82CNEKNl21RA0CXOzXiRj3m9fa/MrRRvOqAd9DOXhKeL1ACUcn4Nthsnr8Ud6Q1CEx46daF9oiQCuVqgn8j/lQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YpTfP6w/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g7mMkMZ2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YpTfP6w/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g7mMkMZ2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJoMq3029218
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=99IT0hTG3QnFDqgRyYBT+gQh1sca6nDcC8EVrVbbkP4=; b=
	YpTfP6w/V+gxrYVK+spC7xoZHzKC95RZuX0oC4tXdV4pni/25tzZ/5dgWRKNxXoI
	X0zveGr/vc9Czu7+9ZzMQsJBMnjYuYZqFQwt2IMOZ80JFIGe/HDjSQsolUeJzog3
	/rAnXJm9gaHm2rRC0ReCc5hzDNoLhspNiUwSD4AhdK4kv20vn9Uy14dhP9TbnGnh
	ZJb4y9QGs8aqswxozztDQDwAX98QULU4vwnIdUnM5M7ma5YSeDkM7hdZMyGuFOk+
	N0U24KUzJ68lfi76njpqkTCJfFWNSM89h19FTBbyRE4kK1RtzPiMiUkwrojKw3Bb
	EHoILHnRzDSI9rKtHOl65g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423034v05c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 19:54:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49AIwkhf009058
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 19:54:30 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uwagt2f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 19:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJwWpeoaFEsg3kBphkJKiATPtuOzdzQxePLY6xcDzqAG+lUJZO1q2nOj1rmuKgq5+DN6/3jS5LT1ZnXX7g7Zz8VJxJUSQpOJHXmN5CoOB2EtDO8q/ev/gOT+6fqt5+obNv6Z+CcBpxo86hIpMJ6Sh7H5GRZp9P78mRzHNqA0mikumG+AThV8WtW1XC3DIMK5bV4kJ19/LhKNiGrsB5/YSXhO97ClbPq+TqT8BbDsXjsFS32utrGsNAgXrbAeIJBkRx3dP6esvqM6b4j2lODnfBlU1ifOg0qGW4jF8Hvrbe6FODfNZm2v4IowIBQ6wjpKJP5SD+SUOWx1LtFhMsr77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99IT0hTG3QnFDqgRyYBT+gQh1sca6nDcC8EVrVbbkP4=;
 b=kzVkSAOgn3vSjjsXzZxBKXv3NdleN5WCW+mqLkVjnYEiDl3rRO5tY4DfexIi0RVQ6B/HNo82zRIhMYwHzKfKkDga634ikCtHLcZXOmbie/ykftmonDlIbAOoroRpmcAwEYi6J3Tyc2D1dmRtLgqHPWMpEhTLle3xBhftbUih9EX5mZDvm7hBDy16sstKVCIh33Wq2hW9M1jKnNXfpS3cVHG26w7nsVK1/cmP6ry6/mMZOHdZqPNpftXcGgg9gra6mGXdbI0CfdMOHDsdaXrbqb6NYaXwbswmavzPaMfNqcEe6cP195/rxaWejxI/NWap+rGFQdepG6i4Age/CpmWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99IT0hTG3QnFDqgRyYBT+gQh1sca6nDcC8EVrVbbkP4=;
 b=g7mMkMZ2KhJ9poENanceXhz0RMULXuRZqGItosNoFrssdhUz5LaLKljaRVQFUGvv9qHf4hP2C4pU8mzWtXCDwtaUN4XMxmK5INku1AhzPICtAnKtyVZV6e7QlCxZJhNLbeej6fqA0rO7YUEVdk4Hch81J5NvraoHNqj7DGBvEt4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SN7PR10MB6497.namprd10.prod.outlook.com (2603:10b6:806:2a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 19:54:27 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 19:54:27 +0000
Date: Thu, 10 Oct 2024 15:54:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] pid: mark PID-based providers only once
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:208:2be::35) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Message-ID:
 <CO1PR10MB47698187B8642706185E23A3C2782@CO1PR10MB4769.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SN7PR10MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ef296b-b169-4d32-168c-08dce9655927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cFWVoHdPKnxi11077gscZ5/IB6TQzqeXkcP7pMpMUjPvnhE1zgJ7pt74B7Ey?=
 =?us-ascii?Q?DSQk3knROYjY+g8wug2m+iSQDhMmIfeWplJgFZOXj6W8gOpvcCLSG8gPXOcm?=
 =?us-ascii?Q?pR+5/xQih69EiKr0Afjbu4tdrx82n4hfoC4IWSK/9XIZKZpFnKRglFTIcrc1?=
 =?us-ascii?Q?ySQGABUeTf9cc0cRrNVvcU3DLRLuVv576xCtJ2qENKMDTXJm4GWgG/L0M5td?=
 =?us-ascii?Q?7Yb1O6WU0PFA5nwxcueg/2EvKSpEy3j/OO09ii9h9Ai5din9fYL1y4caTG7J?=
 =?us-ascii?Q?iagg0LObSqNhwV4emtIXT37D04km4C9DH5kctJxGTulkXhvlKuzwcxzyBLM1?=
 =?us-ascii?Q?JZbtbUEWWaXSbApm4mpedzBtZKlwNsB0mcQhI0t0w6MuJtTa4k0JBzQMdFLT?=
 =?us-ascii?Q?URRK4LkqvNc8+xMSiVKG90OldKi5GA2haUGX+nOj/jUG/wFSUPQbPvhVOrry?=
 =?us-ascii?Q?WTNiCHFC9l6/YR+4LN4dfZSnrStrIKzDoTGqnyKIVJZPKBy1Iy2CgwXwVQBs?=
 =?us-ascii?Q?ofVYYZMWEtO/P6UxK7HUQJoUKoWMPgKvEmEvdGwgzg/wKkO3TCcBBLJoY3Yv?=
 =?us-ascii?Q?xlnNN86xLGlviOwKwGAb3Jx/gqRflWl8VhoJvnUrqG6D0W2aoOy8bxBjBxL+?=
 =?us-ascii?Q?v7ms8lbamUYQpH5vGJc7oAjink/FjYeBSahW0R7JjjkaJNF04v7bbb0fa/YX?=
 =?us-ascii?Q?mfhP1o16SA0B0+t4bIV2TjrJLj4yzIOjMDxi4LvErxYN8tgUYjOqCHGR63wK?=
 =?us-ascii?Q?Yyc9aICskSC9q/Xqf3QNBc8/vChp+bzkpN+itmv0bpUTtF51AJ0lRl8KV4AZ?=
 =?us-ascii?Q?5ggl1/EDWxbiMvygydIRHuZq7ECT1Zv6ft6jjtwSvoqAyuyku2Oo0zrLXCvy?=
 =?us-ascii?Q?92TMa+EYQ8hdTpgbInGBs2Y3zESIGvn+TTtVClcsDo+7qzY+ZYhouGFhTGZb?=
 =?us-ascii?Q?4O+7oMaKHeqUZO/gNjPsdhjZIOdeyhssqV6aKlyWYyZ7kYDbVKpCF/S8CMW2?=
 =?us-ascii?Q?yp7HBBxa5DcJU0tu4I+nqdnmRRlsKOjXd/1uDV3ucJcvdVIra3CPQ+/fHWHE?=
 =?us-ascii?Q?6cwNavhYYpGQ2xeRycnv2riQdZuufMIgaPyp8HWJcmgADqylNynXMgZKCNkj?=
 =?us-ascii?Q?wMPRhBwwuSlPkUMJVdgX6baEJYuUcA1SxNPomBiTKU4Xv24y0yyavXJZ/DFQ?=
 =?us-ascii?Q?ww4Fh/kNdLBqHChwIsb+PJL8rFEwD0GyvH8XVUcc2t2RCXaXZ01NZyYMZg7J?=
 =?us-ascii?Q?KDFqRnJDG9+6n7Je8DZG+WrNHK2nr0SJIysTGPZcrQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sTGQ5hUs6rS6Yir9PD+J5aOsuDRd2EOLQu6HmNxRWfXV4TkNAlII4fOt4qbB?=
 =?us-ascii?Q?DS1TnVgqSyfwH27Nz6hcN3AkBbwNuuucJL5Tr09eXqKGczVcBPZjxsCLXj/D?=
 =?us-ascii?Q?9dM4zlpWg8anUT1G704ldriWCDHzbmq+15c6cM8WzmrB0z0dso9GOq9oUxOT?=
 =?us-ascii?Q?KLTZUxlMerZraQ186OJMw1taZYxxOv6qxb0+96X6h/5kGF2yLCka+rkpURVZ?=
 =?us-ascii?Q?NpnzZkaJhq8QcejVe8tfCkn+Hb9GN3nsCFhLDpAUUd3EiyY6qbAVzjSTy488?=
 =?us-ascii?Q?P1aMds5QIsWOINqGHkSuk9d2xwhxouSM9hnE53FAWckgp1r3eSOrwRf+bByj?=
 =?us-ascii?Q?G67DvCLBclNOzEG5ebgTf9YIr1Lt/xTxaDwtV82n5hIVBnsPq4C64jz6Nmi2?=
 =?us-ascii?Q?BXHn6QP7vMlrxtjdbtoZW+GXFBTNCWa2oJlHnQsLblyTJj+IQYYxTRapUrDb?=
 =?us-ascii?Q?IQJT7xOaGYzyXhWFTZ59/LXz04zmq335vNAt639olSCpaYXfOBMSm9Veu3R9?=
 =?us-ascii?Q?ygNqN/TcSLmTWnvI4f/LzNmPLf0/O+KmRsqeRQCpTCUGc03maMlf0A8+zi3V?=
 =?us-ascii?Q?qQk6AuYRb5Q6vAYMP/7zlT8ccFh978CSAzqAW5pMTiGiB+hwKmW4PIyMR98p?=
 =?us-ascii?Q?CEhNZYfrP4DJz9sbC+DMCMJ7r63hDEn2vQYbZKbkxxZVz/fbLJkmL8U1GPAG?=
 =?us-ascii?Q?pFJQ9lVe5R0sCvN7isu+z3PHvYMjJEr5sXEiRll7lg+6sKLQtCrl7czMSRnv?=
 =?us-ascii?Q?br8kj0EH2YBagikK4qy41wG+Eqdulo6MlOnGqjz6rCovgc/IQHFMJCUWMZ0p?=
 =?us-ascii?Q?lEs8gmOGlXb1XzYqqqxESJjhtC4mDh3m9woDn9GFsaRLFluWHQmxOmilNVyY?=
 =?us-ascii?Q?Ojb2nztneEtTXOYTUMRGfxQ2selEVmMJPofCy/B6m3kzRxaDE8WfDmcT1t9m?=
 =?us-ascii?Q?ZLnCpKVUG0iiXivbtWGqjIxhQpLAA3U9kVW2hEmLfisLyVL9rV/z0jFz6/jk?=
 =?us-ascii?Q?sokGpo65qsRc9fd0vCCeVaLK6LsThFyRn0vZrlQqc5ieEE3baXlpthWBSui6?=
 =?us-ascii?Q?EK67J4xaXB/u423TInGFokFN8SWyeHKxrGdy5HCWfdvPunnHbPzAJHMEXs1Z?=
 =?us-ascii?Q?dRj7fXt6trhtWo06NcpfGzMFBwwK7RyA/kvvlex0un4vmpOneMvcR0Yjbgue?=
 =?us-ascii?Q?GlouBCneRZsIbUS46j9ImYJFafzWRcVTREtJq4Bmy9Rajk13RFksaKNiVmGi?=
 =?us-ascii?Q?PzKObK/q4FHKnAZeuaKWCnVEvtkS2mlaHarXEy4AaBjRFHR5jBiq5D2C7tv7?=
 =?us-ascii?Q?gRbwYmDq7lLGkAnXTSdne5nVO083VBIx2tXoAJMreYD6xVuc+XcUB98SyZt/?=
 =?us-ascii?Q?MeEDiuPTfoLQGG4JCfh9FX09GLEqYuF6gQxagsR2+Lkz9RfGr2JtaprZb9Xl?=
 =?us-ascii?Q?HPMSVQ4vlmEf/+PmCmT5fTtsJX68XMIi5/CaJfNxJkN9Lct3m2ES86RKhoSj?=
 =?us-ascii?Q?aesUAFEOmDgxoNkZWwtmwRJMJDOPGNZKwny40ftvVnp6K+rRy5R731MvuUOv?=
 =?us-ascii?Q?apwHh3uwiGJF1tLBK73RnNWWcCNeJNIqcvHLeD5srYUJBsJ49eFM05GMSYyN?=
 =?us-ascii?Q?JIsO3fiSoyyWUIeupfQsQjs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	52txstCQ4+shDJ+TL6sZ+UwI19iAVKpvg2xZqVsk9e38GoVUrhh9fwzB4YhrmTrU4oiNJO1Ads8QV8+gAgerf12gBqx37quCp9mYbDcOxMhXb/tmWlB0yNfwfXsiz5gruJ/ZYwv/Z/UnFpgQ+ElPJyRh6QMT/FwiufAgAJhzI93U4nCVT6EOieHVcQEpQ9r/5SH0FBMu0+cGivknIETBNkAHuJNJg5SRt3gQt4+gmiKx0sH1XdVnTXCUJ+uWSsG+2TDKgymmEJzTqQyK+AZDZAfI+0jO4rq3xadkldH7tYnGstz0CnqBKNKVUU2Fo+5yJMfDF9mp0I7HxzQbFCVtEn1DTHZXvsB4OWggx5vohdgnqyAeekcAMlp9jz42ZLrKW+8OGqfeKLlJVcyNT4rX09IQQSHk/UZJfrjvtnMLwXP9oiUg9XALno3eeRtpeOQxEscYb/xgbEY3G4hGeuy0yRzKvg19hzgjgXxVmkbnOEliaBpPy92W583t2nxcmX+B2P0ufxmP6Gqs6axvpC9Ik/35vva3Z3JrlOSLIPzODzBwgQLr9ZbBtjQ7mC2TpA1ehweJJN7XEVGiL86VvVqo/67z0ELu4WGLW8U1rPVdCxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ef296b-b169-4d32-168c-08dce9655927
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 19:54:27.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9G3dXmjiRxdmpexRrurWnX/OkTShhQNHiounVeRx1y4HkBiZdEgr34RQ0g9Pp3DMeHfD574rTIrtsfOZg8kbc3NI2EqyXdXvlaBlmmsExpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6497
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_14,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410100130
X-Proofpoint-GUID: X0q3q52ZRQ15z55rsOyKZx8oyunQ297M
X-Proofpoint-ORIG-GUID: X0q3q52ZRQ15z55rsOyKZx8oyunQ297M

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bb172ace..481159b0 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -252,10 +252,10 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		pvp = dt_provider_create(dtp, pd.prv, pvops, &pattr, NULL);
 		if (pvp == NULL)
 			return -1;
-	}
 
-	/* Mark the provider as a PID-based provider. */
-	pvp->pv_flags |= DT_PROVIDER_PID;
+		/* Mark the provider as a PID-based provider. */
+		pvp->pv_flags |= DT_PROVIDER_PID;
+	}
 
 	/* Create and/or lookup the underlying probe. */
 	uprp = create_underlying(dtp, psp);
-- 
2.45.2

