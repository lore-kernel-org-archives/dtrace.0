Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E23702E4
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503584; cv=fail; b=UpnzgARcQIOOqDZpN17/2jCpgOnl7xpCzmqqXGd34PLIKMqydISsDsWToTkKaJYLgq7M4tmB2Khwm6ZKeTCszDJwjXXlY55mKp91/lvHU4/5CDhCPAJCS2NZNAiS4E7eF0oz8TCHxo13vBQYH4jXJxjDisBdO7XxTePnCgU4p9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503584; c=relaxed/simple;
	bh=3G40UZqrWT1il0/f3G8MCWNvnPurGx4fqNUJmi+5dWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SNIm5T9A+ml0puJ7PaJfAgdN3ybKIN5B/a62FNBX8wxWMFVB6GBfcgUW2gQZXPgXbqsAU0Zpv2LS1bPcTRKQaG8a5zmxalxiiJwREiA8PpGN5pyGQfLFQ8LYIn/3Hxf5nZEkF4g2y7MckD+Zdg1Li9X2dZlWJaZ2bDkM65AfjJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MBuIYCSL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HCL+5mvr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MBuIYCSL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HCL+5mvr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AILO900025747
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 22:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NGIpYnzUOz7S9FT6Ej
	iR+EeGj9cwjVFriWR0xHcnhSY=; b=MBuIYCSL4U91tCLmz9os8yhZfoGGy60Z1E
	/S9HkkAciWfP4vuOtDhEWND/BtV7VLToRSoeCuK6fMssHWstsEmSsXId49+iztMX
	NGlHJ3Czk+A+M3+5jJIfoTikJNnoZ+QUtmJt0qokOuttomaSOZAbDqQGr7t6cYy9
	aMdIQGvWUjWoZAJa+/+jcjeQd0xNrIASlxuys+alYhDOYPiW0A9QOdMmJ/o5P0nk
	T6ZrWlj4T5yYKY4AuO+k8n+SLLC2MzQoR40W5tMwhx2eWc3DaetvQ8JgosIkk/Rr
	Ppxc/X8HWChkGbsJt5RVe+EhUkLMhNGHyWxZxJFYDiJTG7S1btYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej8j5y49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 22:06:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIK9xr0004405
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 22:06:20 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9gthq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 22:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JV3/QIAZwDNP9rrV/ACaHWtFJ8IME47na/6vtRhOMHbvxCfvQ2xgjkvEHlvzaJeFOOhMd8YqDKanJLAhWiJ+huM0uzZh6WA8dAY/azqw2pTT2W4UdKw57kKjBSueV6p+42dd29UJB46sHD6zMX0xIw2VDPmC7uGqsPSd6wMxRWKwC21joAlgLHJzwuGZOvKDixH95G1fKJpCv3UttoE6Ab3P+ZGSqdgvJ884o+ccnJzeNcu+nt5pUcw0AtPpHbjY4qD3zKMSlu4WsBF0kHrcM9ck0AfFdjjeNIBc7twQnRlLgVLxsome/X2nlOpAcCLESE00+pXOhKWiTummPHj46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGIpYnzUOz7S9FT6EjiR+EeGj9cwjVFriWR0xHcnhSY=;
 b=heEW3WHM7kv2nCiWxN7eeaV4rAT3cgDEERxLNNTiuWKKnoACTRXNXYMIQZYW4TFaix1gzdaY1rI89mwUdaVRYT9lPm5qcRPj3ZHYjX/gTVhleVju7pH0SJfVTGzY3R+iIrOuWZYM/i2TfPVhoxZ4u4Ehh2m0fBYOE/Q5ibmTAhqbCptBbYje1O6IDKh/ulYsB8zjINxND7HFDmKypJ45u7LujpPxmzsyqOkBnedULn4KEUqK4m2hrIswEPAR8qdONrgRKeD78km7ie9z6F9me6MQbc3F6zWLCqD2NtqY79BhkhKOUEuvWqSZPK/1BlJD6Lh06njp7aBbr28f9LY+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGIpYnzUOz7S9FT6EjiR+EeGj9cwjVFriWR0xHcnhSY=;
 b=HCL+5mvrcH+jLQTzO4HVmQzx0KZKOT8amcOqD7YS9mO5DY/BFUGMYHSOIzYhMs6FBV9d+ChGFnjhX0pYRhfEDSBYA775Z1lVT0KfGG9FQ+EtL31QITH7yJ9xz/81fNXbPsDMFFMmuvV7pIzROVGF1sGH5YIU0Z/1wY2gXPHYJoI=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by IA1PR10MB6146.namprd10.prod.outlook.com (2603:10b6:208:3aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 22:06:14 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 22:06:14 +0000
Date: Tue, 18 Nov 2025 17:06:11 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] Update README.md for RPM info
Message-ID: <aRzt01Q32KRqnetm@oracle.com>
References: <20251118181507.26266-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118181507.26266-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|IA1PR10MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 7244a6e8-0dbb-4963-17bd-08de26eeb0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fHCoBPqA4nhuXY5GyVmUMElYR0jylIm4z3kkW/h5/CQ8zR8reUIzdUzcNJqG?=
 =?us-ascii?Q?yob94HZ3Uj2Kuj2h2Vm403NljAcLW96PBja11jn/Egm1x/IZK7uqz0QC2Ftl?=
 =?us-ascii?Q?XQTB2NGW+C6WlF1jNON2HMygCOoqkbvrAEy0Bo+bIlPX2QGgiRUafKxp4Q1U?=
 =?us-ascii?Q?0Dxw0apRY+ozf7CYC+ETU38Kn2JShhVi1WURBgLaoqdMdDSXGjJzunww0hJN?=
 =?us-ascii?Q?CNIs2xJwrv9ZKne9vi81DGRJNYo9P/owsxgnvxAFHjxaipzNIDpvzitLGl2k?=
 =?us-ascii?Q?yWTUO49o8vklkCl7bJPvivxhhnDi96xg/4lrq4kKY9BSfWPgYGnT4ayMjv0W?=
 =?us-ascii?Q?EMX1hTv+wGvHuQL4PbfTbjGt+6D1WGH5qT57cQ+PTX5V0jIgwxZIzcCyBVyN?=
 =?us-ascii?Q?cvuGu1WMDSKlq5hfkiTLVXkGEhV7THixqPWeY6i6/5prNFnlun2pz2fwtzZu?=
 =?us-ascii?Q?1NmfqFNbwZZ3x5L4VHUM+09zy6pCBay2H/svKcsZ/g/flaK7MfISmyInI/6S?=
 =?us-ascii?Q?zdQ5n2ZFecC6mngDgl+MYPeG3h7Eu/9E0QwkeoV5CUhlLOo1wf7yfkU0OiFS?=
 =?us-ascii?Q?hY1ipaGnOGlSyh186lmrHlxJ3IjbAo03158McVrxGgi6Nus4WzGFB7Jw9be9?=
 =?us-ascii?Q?UIkQSNV8j8kwAwUGnK4XIo8V40SxifV20bsgmJFSfq8cvEEIVBJfLyTiueL+?=
 =?us-ascii?Q?ot+ndCEzqkcLddbSy8wWTv1TLhar0OOqHYcYQSeL3VkTDgIcfp1KAI1bGdyx?=
 =?us-ascii?Q?ejAIWDAncZ14PIP213sYJKuUG11hCmbtsUDKJLbmQwhAC0u0cF/JPUOuxhtZ?=
 =?us-ascii?Q?bK4BKPr6qg9yQaafBYnuFRkF8QM87KPpE1a/ldafvAzii7mx4WEcXfc9hnXZ?=
 =?us-ascii?Q?WlExucrX7k2VSWr4auflRCfoSBhT7loVILmmqmNzXh7oHEk8kSGEnKaTfMlD?=
 =?us-ascii?Q?l9gXey2YasaMcRMIvCqxbd7c71tsv7/oqybKhbZmjkczBRj04pmCweLCyaXG?=
 =?us-ascii?Q?UJVr8zLi0XeRxIOTKzbg3DmqYKJHL8gCq2EL0nn+6ZuHbUvVMsGu/oUNZGUj?=
 =?us-ascii?Q?Krp6PlkjGxJJFzGt/9ThBPvlj9y5F1Bjs+ezxeXAunQcB8108ZbnOxeX5hz4?=
 =?us-ascii?Q?2vP8BmeQlJlN4fMVXDoIqCa+/NkqJLvgvJJD//Ms+AVPOC5IVnTP30OJmC2R?=
 =?us-ascii?Q?ZCoP0fXKVxulGYxH15q0OGHV8XSDOH2Dmf3i680KYvkFUJ4AKyRZv0kq5CWc?=
 =?us-ascii?Q?NNVuWVO8pfK8z0EGRD4qXdJ4v48+HyO1OqK6Puz27rCnmtgXoMPoSxPMYyFf?=
 =?us-ascii?Q?L6rzwbVkBsJ8X9tCjaRbDHA5YG/vBTEu9aPbyEBA88RdlPyTfxrcMAGo+BiX?=
 =?us-ascii?Q?gfkXmovYMV+WKEZyXQjHC2oCvXmmzGqqjh7J9J6i+ih6pYM1/PRv4VvtlSQd?=
 =?us-ascii?Q?a5ux/Pvm3XA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uwoHwh9QUtPEjMf2oLobx2pDduK250NdnJbl1k3FLo09SIdqyD/Znn09uu+M?=
 =?us-ascii?Q?zuzQD7WTIU0b4CCThwaJ5R3OAvhs6ZIMm8XlSSzu4t77JWsEiNZnZg80TNUL?=
 =?us-ascii?Q?bYg6Je7HiRAeiB3eWKH0qMJydTmKq9Hz68PXYku2PxF75sq75Iap5M4g9Uw/?=
 =?us-ascii?Q?b4ET8oSNWZjMw4w36yG/j2E9fTeKonPESGQrxGepIfwYDo1d9nbCWnXfYxrY?=
 =?us-ascii?Q?kO5uDdJ+GCPPEM/hwAVK3OGa+4Ci0OvcVL0Lbfgl1RG8xU9/lvSQDrRpSMIL?=
 =?us-ascii?Q?Zf2XXYRsoHK8B2tSgYgFsrRv9tPVF+PymQB1lGTJTLZg93qSahjKHlNyRfvP?=
 =?us-ascii?Q?eLhbAY8B3ohzne2kbxOqrFbre5SSnnG2Kg9YtN+oWAcD4tNohweb97a53Vhi?=
 =?us-ascii?Q?GDa2wPpBa3rdXVwGpFETjaXy8PVCBuY/6QV4YqrydAla2hpsirnQDIyx26IQ?=
 =?us-ascii?Q?7/Qls4twZrvZnSyIAzPrRAWkMFxUyUNuzxHNaDqmgNqiKoskxAdOFoiFkpdj?=
 =?us-ascii?Q?WiSJIE7psxUwEverQXTMQ0E4g/+iER5aU0pchM17U4RTxxrcxMfgnixszXrb?=
 =?us-ascii?Q?erQfCdgL/xpzupsuaLfJzBDAayzKRDpUw6Q5lm98fqZ4FNGtANsD9jLed1J8?=
 =?us-ascii?Q?eSEO/yfUdnsMycJs2WqdIbfIvHWsjkBTl+hYTH22BO0w4aACN9w/yfwPowcn?=
 =?us-ascii?Q?OYkqweiZvIjcEMa+trUrGD1q62cuuqD88fGdBFo23hV0FtSWqjjl2nN52rxq?=
 =?us-ascii?Q?k38VlFaS4KspO9QPdDTlqN0DYv1y82StCTQgbER5AiYqy8jxi/JAbPie0YpZ?=
 =?us-ascii?Q?Q2+J2XnOpwYx+o81ldwuDo0cux8STz1t+VUvA5ugvmuYg+DpuXrYiwBFlobn?=
 =?us-ascii?Q?+bcms/1yB5G37Rdw8253YZAT81AvOu0NH9EZUTazZW01OmUYObTMK9B1KWjY?=
 =?us-ascii?Q?Wz5iXf1fDkqfcQ9zyFNQ+G26f+uZ0snzXQTFt+6ZJ7nluC+t4ALaz7AHOP+j?=
 =?us-ascii?Q?EuCRxJttvu8yRg1td0TT/Mp46H+jTTx+Irnk+JA80XywxUpUuWvzmFZ7Dmja?=
 =?us-ascii?Q?h1qH7kI5+8JIhexdpm5z8r1FxFkO8XldIhC16aG+rMrZ8bb+k14yJGyHqjzU?=
 =?us-ascii?Q?mD4iwnpSszBbxqVibeQRp+2AbeVIVCWYk4/Me+LWKsc/N9dcxmdohd2OxFGe?=
 =?us-ascii?Q?GSkQ9Rty4DCP2GWRMKW+TDU5pCdFjb8MG1yioUCjtzjKYv/Fbbzel6wMHt8Z?=
 =?us-ascii?Q?yS7DwG+w/FbyiBMjWMu819fe5OFapqmp8RNArGYroumaBJoV1G2r88LoqY6h?=
 =?us-ascii?Q?kpadYSXqeA3B4coC5Xf70sm1mVdWMHJmMHdBouL3Tjwjr4R4Z/zFRndW9zGy?=
 =?us-ascii?Q?J0XaLXARr5tSN7H7NlKOjStbNMjlALqsZQaDC6iC/PORA10sw0rMl6TDsAT4?=
 =?us-ascii?Q?F719MZVPZuB4/s7udtD2uryvarx5k1d74Q2rnJ8AENWULLN1ZYako1Qqt4ja?=
 =?us-ascii?Q?22xjhjYnzgZYpPvaBHRiXvXSR4UmEq5it+9wpgWTJqFxAflVfv8MtzWDbaUc?=
 =?us-ascii?Q?llsEG/mO3uFxXkzr9v24Tf1m57IU+kdOObJmh7vm3+WTabjILYcEFkyQcVke?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A08DIVEoohe8xZN7FsWG2K2ffjuoAzrzOcGKHB4gCMhsq1dfsxk8+ay2GIHLpJZyLAo/8B6s0dZ6qVjJju3pKLDYyOhswAUIGeSgzsAjY0FvQkMFornM/44vAFiPIyNOj67r3a6BhUwXcVlg50voSy7qrc/ubrSQuHsfVAs9hs+mNejb9kW+3nwtDOxXey1DE6Knho6BcKJnPuIg23vXnp8Jv6c/Yti2W8nEemJrPDL5UNsQwDzPojy9WnzHj54J68PbrtzbrRKWGPEmyarnT3MtmyLJdugSwDQiMvnXREEbs9KaOzE5SiDSj/ItO57jzaUyipqzu7n/J7jS7M53cyQ96klK2ut38TAo+mbJbk79MvC/x4xEmROppgfcq5qyfjcNM9MUZZl3nfeupOBjYRpVTXKuoz17l/+ehap+U0J0YiGQFUp8Fnm8cR3ajTaykLuexhpo5LOrFH3XDNsng/IfjUHaU4qVV86ny5xOTLZenOHCrxqp5cBArfWC04VvdZleLBP/5HdbmZ1zlKtWVF9OQ1j3LVF1ZafBV7B+e0LO3MFWs5rf5zVzKSkw3ULVEi8qSmeHTqQtJVWrEOhHkPpaShWaEadcCSg80a+LFWU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7244a6e8-0dbb-4963-17bd-08de26eeb0e9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:06:14.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2f0YOMRwx76u7cSCYu61xAXxUPHQOG6h6+fYGW8eMZtt9T1ljTPp6csaTe8A+Xwrar0Qjj3xGUgO4knHOcr7AFPPpu5b1cqr/BbCNNiRCLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6146
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511180179
X-Proofpoint-ORIG-GUID: peW1uEi7yJ8lup-U0X_Xo6CrWTYa20X5
X-Proofpoint-GUID: peW1uEi7yJ8lup-U0X_Xo6CrWTYa20X5
X-Authority-Analysis: v=2.4 cv=I7xohdgg c=1 sm=1 tr=0 ts=691ceddd cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=aIz_Co64duF09TpWQkwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX1l9WJpJ0Huge
 nfF2N5wapIilAQB3KQttBwfBSG5i6wS1k81IdLN7FEoqMZMF+5t4kaEXEHgsinXXPGVgToBTlkN
 SAgs9Y8rKlZDsVwNvqnifrfCFSUCTbJuduEaP8ls+3cVp0xluWxIMC2ihe7jRH2CCo1hJMD+lOx
 PB+NtgCEX0uecmhlrghJeks1jCrnojKoP20Id+JxNeopDk10/mZXv5/RPQeOUdpT5WkEOeOl2+f
 GP9ZOGl3uT0l8xiBSf4DljDnjdyeyou14cVXzQr3GJ7obzi/Lr4JTo8T6fpae34MhP5vgdKr7Iq
 yuX0kb8tNgaLkdVB/JTerWDtyb4SGpQG6EA9FDQQ+D44xLmg7HJMJuTUSEWEOk1js3bMm5twBla
 PdK5dL7k14khs7SDtd/b2/3Cv2tmJw==

On Tue, Nov 18, 2025 at 01:15:07PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  README.md | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/README.md b/README.md
> index b54189b1d..95e434340 100644
> --- a/README.md
> +++ b/README.md
> @@ -9,19 +9,27 @@ community.
>  
>  The main development branch is [devel](https://github.com/oracle/dtrace-utils/tree/devel).
>  
> -We provide prebuilt x86_64 and aarch64 DTrace userspace packages for Oracle
> -Linux 9 (UEK7 kernel), Oracle Linux 8 (UEK7 or UEK6 kernel), and Oracle Linux 7
> -(UEK6 kernel).  These packages are based on the Oracle Linux specific release
> -branch [2.0-branch](https://github.com/oracle/dtrace-utils/tree/2.0-branch).
> +We provide prebuilt x86_64 and aarch64 DTrace userspace packages for
> +Oracle Linux 10 (UEK8 kernel),
> +Oracle Linux 9 (UEK8 or UEK7 kernel),
> +Oracle Linux 8 (UEK7 or UEK6 kernel),
> +and Oracle Linux 7 (UEK6 kernel).
>  
>  The latest packages can be obtained from the following
>  [Oracle Linux yum server](https://yum.oracle.com) repositories: 
> +- Oracle Linux 10 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/x86_64/
> +- Oracle Linux 10 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/aarch64/
> +- Oracle Linux 9 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/x86_64/
> +- Oracle Linux 9 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/aarch64/
>  - Oracle Linux 9 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR7/x86_64/
>  - Oracle Linux 9 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL9/baseos/latest/aarch64/
>  - Oracle Linux 8 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/x86_64/
>  - Oracle Linux 8 (aarch64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/aarch64/
>  - Oracle Linux 8 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR6/x86_64/
>  - Oracle Linux 8 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/
> +
> +For Oracle Linux 7, we provide RPMs up to 2.0.1-1, but building for OL7 has
> +been deprecated.
>  - Oracle Linux 7 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/
>  - Oracle Linux 7 (aarch64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/aarch64/
>  
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
