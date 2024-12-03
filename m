Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DD52AE68
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226388; cv=fail; b=LmnsHoX1L1Yar+/07+qPeGZJlTounRlecVJaDQsS5pplOMejZuw2w+3g9ap7/drsurHpk+EEMgOvwBA5I6q9m77r5qxMie7ZZYey6r65JylBVS8AgrJtNVHUs40+GqWDoCicbWCXVSUnQP46YypYLIYKxaXwTzBZGKXLBNruw1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226388; c=relaxed/simple;
	bh=zP23WR3aYvMu4GfpX5JP3HCQju20vIFuVt1zxvqS+bo=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=iBUGlMWu5ZyDHw4kWE6PzdspB1jT1Iif31tOQKwbelm/eGjqO0kIQttE/guh1xhUmO+DBato5X1rIMvUAeMX6xU4f540DeKJaQpP4AHbtu3/InEehYJL72vGzVBw/7Rjr8efLWh9Jy/jExaoviGgMDYYSBW0VuBProgd6h1EKs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jTS7ovAL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mcf/zAXO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jTS7ovAL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mcf/zAXO"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XicA002812
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=pSvuKu3QA/UU2gu9cQ
	8vYkdaNhugYT61rZSWJD8iKDo=; b=jTS7ovALr6ulambnZ2lMef2R7IQdsREDJW
	sEvvjDffjm3xMSO2v+Od91tcV69Kqx0mPKRlJgt4LZE5Bq1TmfFJAqKJrkULg3pU
	Oy5A7HKdj4xyQUxO1rlLbNSjfHVyOpcLbNRb4VkrH5iy5dz+QF7oqGV+GRRZVrk1
	Xc2QPOayQ8dRO+cvqVFRvrPgEBaXGobmVdWPudU4hscv7vxpJjdV7d5eaieaO9zi
	w5jXzglpd2yZmBZX1rA0hrLDlQxOGaR1X9Zlg1oXnqiQEP8WGy9tTqp8kERCRkns
	nRdAx2Ioux7gQTeFM3pNqwD5mFvoWegURGx66fnKTetluAsdXKzA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tk8wp5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:46:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3BF9JS031386
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:46:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836tu71d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:46:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VISaBDdiFmC7QThLo0G9avw1TS6Z5ABakCE0KshAhWdV3eiv2YFxVrItmuP6MlbMOgtIIpkA+xSqirH5/GYm+9Vl53Rz0soNi844CIt6JDlKfs4CvjfTKqzd+uZrvL7eFOULk8AIWDGEeYzNE43D4qZTENMc9tHItYOcaIBp6jOX+dnFq/aakQ5XXIwm3DxBi3GDqhgNMev/OKfux17+HhGdFWQbaR5JX2T4hA+5MWUooFID+XT7Ih9/XQ5fall90J10wQv7H72bhTZGQnmMYZqSUHUjWQlprt3g400deUZHjAPWNdXi2ZAAQNZdlmy1rW5WsjJVhZ0ev5kSA/kOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSvuKu3QA/UU2gu9cQ8vYkdaNhugYT61rZSWJD8iKDo=;
 b=BdxMJLY3An3BJvG9C8RJFzn63CUVvEsMrpyyykTn9K0eJskUKRoF0tgbwZkQY/mQo252N9JYjXLEpFoOdTfA4k4H7o0qRcV757RZmaFiOtw69dMsHV7oer8cEEP350jyqB13vQ985UiWygMJ1sZKq4Ss2Y+bYVfTiWYo9iKyAVdQpKljQa4fSbPKdRHIvcalkiyCJGreQow8SRfK2bSVCYi33wtzXf5/8nPGXWe1yehOq1sCEtc1EzeCqz7Tl6kgci8ez1azpdmfdPxGv4Tg3cw4/Sjg1DDIvcZmFFlm4rBz8qGVNlb1r4azEPm8bF3knlwxmMVa9mw61HGXM5h7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSvuKu3QA/UU2gu9cQ8vYkdaNhugYT61rZSWJD8iKDo=;
 b=mcf/zAXOWhvtH331QDWDd4mPh+59tXQUpXKVtdBzGZI5IjQxGM4/7buv5xK1aDxqx1jdH5ZIBL+Bz85866/3MY7sDD/QyLEdntcWBcPOsHlP+VJ8iZk+vvfCUGGjB4T/6N1G4Hu2DbP8NC82SOdeZbDoA4Qdbfhrg0EqHHyYL7g=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SN4PR10MB5543.namprd10.prod.outlook.com (2603:10b6:806:1ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:46:21 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:46:21 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1/4] Tweak self-armouring
References: <20241004044355.25870-1-eugene.loh@oracle.com>
	<ZxwHW_cxAA4x41bZ@kvh-deb-bpf.us.oracle.com>
	<871pyu5eiq.fsf@esperi.org.uk>
Emacs: because Hell was full.
Date: Tue, 03 Dec 2024 11:46:09 +0000
In-Reply-To: <871pyu5eiq.fsf@esperi.org.uk> (Nick Alcock via DTrace-devel's
	message of "Fri, 29 Nov 2024 13:57:17 +0000")
Message-ID: <87ttbl2dmm.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SN4PR10MB5543:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0c5033-246b-4828-a2f9-08dd13901b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pg9EgY8vaEZ0J6y5GWKjQDLiHv4ZgZf2oQ3WhxD5Qu/3oKNavqDohGD8sCnR?=
 =?us-ascii?Q?8/ovHJTQgqfGN/VG69sQ5Ctep8VYND3QWiu1vCN8BUyB2k3EZPwUvRazgqu0?=
 =?us-ascii?Q?6VJU8vo+v38XRxfQwXBjE9tCA1NlY745D5ulwELKF43cT+baYySxAGl3uAj/?=
 =?us-ascii?Q?hi1fX69IfYDdbt9ypI6tdfvAe14NGU+cIwfTtvOTFpwAFROhn/bgcmHBbo17?=
 =?us-ascii?Q?8CitcSMCRnc7qpK2K92JgnercL2OetySP+l5G3LVhReYpx1UVhRxDdkamzPg?=
 =?us-ascii?Q?2ZoZzD7rvHJF7AZslQ+LJBzqw/Pe300JMvpbPGW/RuiiTucbjtTEesXMhUNu?=
 =?us-ascii?Q?GB0L7ccy/kuMy2lkQec+TLMGodNLLZAwj+m0+DolpvN5JtKabTYQizEiH8Yy?=
 =?us-ascii?Q?u3ngK75ioT0W5+gMcYZmLd3CPHNd2QZ4w+pOIPhn9c7ug3vrpbNHED8lYxxU?=
 =?us-ascii?Q?O0KZ+rszs7fTFOkhq9FlhmAk3rM0fljAEqvGbI7s6ZqdEoqJjCaOZiSCR7UI?=
 =?us-ascii?Q?OgQzRAqQdBXSW+kQyLG28biOZJJmxUL8NeigUdIoSx/vDcTKzptUhBCp1ULd?=
 =?us-ascii?Q?YK1qbqeMW+tG37RLg5ZqtFca16Dz4ouKRCVPymnPlj+Uq8et/Av72tjApLUk?=
 =?us-ascii?Q?5Go8HQt2ApQ81gDDUKmebsmSmAObzcvgD9CvgQGy0DHnRs2zhVgZ71HreSsY?=
 =?us-ascii?Q?+E8YUutHn66JOrSxF0rjzHTQzx9so57ZQReU3dS2Kmq9T3+MNkzTDuDBAZok?=
 =?us-ascii?Q?cKO4ApybyXrTEeguhw5FHXn73hDvZ1zOCy0Yy7lzut98vB/ma2kEZejuUOYX?=
 =?us-ascii?Q?YGNQVOsuZReGw4q1n1Er9e+swc8MgLmkmO/0AHA7UyKVjmzqJMKo7ZWU9WJH?=
 =?us-ascii?Q?2/VIBqwxUCn0h/O2VFPCHQUZGQaK9KUJ3wnJB9EZS/t8Q59BDXOPMxN+6fOh?=
 =?us-ascii?Q?dEQNEJxOBMzW0I8ladm4aLG3dUx5y7FcTTy5CNKLJGRXs4JFGGYP7MiiM4TC?=
 =?us-ascii?Q?NeUDlypfycWTTQFX0bJoi2aNMv3V2g18+LcIn309iQgAtTalfKzN29vHmWfL?=
 =?us-ascii?Q?wKkr3ZELX7sFYgAEM6f5wMsFSXhY3LULQOGwIkvCkQ2Rg8CGiRNKhX8Gs45/?=
 =?us-ascii?Q?BZ8Q+x+u7hCjg5VDxwBSdtZAYz2fCcPQGGwEIyxMwkQrdVGC/ewXEh6H9Sis?=
 =?us-ascii?Q?DJMI+kJRBvcogIvkioL1ND0P15LKGTNutvmeybINclRij1VrpNWm8OSAML0V?=
 =?us-ascii?Q?hvCIk3EkUJzSasw+FZPkyfkS4eZwaIpoQ6eOdiuF5CcohInegYGAox8iMKWf?=
 =?us-ascii?Q?+zmotNpNUohdLXh4U6Bv3ke9G4TWs/n7zlTwbuTDScz4Wg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hnHhufKkRI6PbkLD9i10zGwIn6VGoLPSE5QCfGVWvBTKQZQFBWdHA4h4cxND?=
 =?us-ascii?Q?7YFqZ6hAV0YZrRUUSnoZXDdgqoLnqV2AOPM6ZR3CF3HWWiAvc80q/BPhIySY?=
 =?us-ascii?Q?FtTa/uhHPBiDk6xY19FXEr28LIqFOAKdaxsSfFSgr4o8k3x6BG2+HFrn9Ik3?=
 =?us-ascii?Q?YiS/AJR2Aherz5Mq47IOiwTxm4C9jzUxF/xC/wDInEob4YCTdqSNpG2lxOT5?=
 =?us-ascii?Q?OjASIEe8ZXQ3lZ1ZhcepOZfURc3xWGkp8iiq/lM7IiUONyKLUAEPaTR3nYhO?=
 =?us-ascii?Q?HTvkG/15bjppFmFJ0fs+HZUWjlAuFsHS1HIMrXn15X/BWSQ8huBrWUW3eFGv?=
 =?us-ascii?Q?5KC7L9tNsCwdWGVf2z6E8IT0akjJr18DmsrKBxgdFACKhjhmWBf8ZDHbPYaV?=
 =?us-ascii?Q?LmytFXhgZfVFm8UdWdv8apgCwRp74ZmXaWbaDC2ZqWq+SSDLCDIW/lpViQeJ?=
 =?us-ascii?Q?vXNHxdNePEWyTppo+Ge+IhlSP99RZEdYEInvrNrpWER06pXyhNZu7QcwwZrw?=
 =?us-ascii?Q?Ec3n5E3iKW/MvtYbBYQSNk006kbOgpz/QOplYv+Ianaskxl6AyUmezkLuqga?=
 =?us-ascii?Q?wIjvZPu71UBFSNdKw4F1DQX6YJdwMmopxNdG0QeKLQzyEJCDR6kbc0x/8GsV?=
 =?us-ascii?Q?AhMswx46FukZTHXbTmErT9cu3Y3Z0VFCEaP2XBB1ncZEh+0YvGIQlpW32SGP?=
 =?us-ascii?Q?UASz7euzNuFc8SEPguaZvkmRf6cHMAlibm+B8QD+yT0bnapefrrNv0bQfrZJ?=
 =?us-ascii?Q?4zoUBq+m4z/JHlVmxE4h7MVjdz9Ray7+6oYrYH+a8nrF6Ns1lpFAhrWx+L6T?=
 =?us-ascii?Q?sSy8FELsUxxDsv+SgDyrgipQ6/ato1a09jLikXavjUXGYp+FbxoEMEW5TtFa?=
 =?us-ascii?Q?NG3RRu4spWYxWt7Sm2bIXLxQJbDxoIvRPyeGU5V2gs92rLPSI1TGVe/BE4WS?=
 =?us-ascii?Q?fmYwZlUZrE0NlgF2hzRNUozXgQSE7th8YdRk6dRpFffArTOuYlCC5ynbQPZl?=
 =?us-ascii?Q?a/KDK57ily3iqms64Q2CxtMWnZe1SCnqpAgI2B5ZmzddBo/cmur9FUAze0gR?=
 =?us-ascii?Q?hATT3ibWZNYIX5cwEYmyVvdvnZD7baHUbrAG3bI8Zrs7qEUGjHosbQIIbr80?=
 =?us-ascii?Q?dXzx8VVqd33isd1V3IxeSZRGyHTw/D4EwlorM4LBTgt9aj9PCnECuRM0q8Nz?=
 =?us-ascii?Q?VuXORLYXHQXDs3cbHgoylXYzbSvrJUzhKtJjJYwFb3ct8KNtxUiX44UN8BQm?=
 =?us-ascii?Q?5Xge6bC/U5yKInLKh+qU+56Nvx5T4om/9n2JvZMkUfxrzSe+bgrTmLfhIyYq?=
 =?us-ascii?Q?DdBz5oj5e7F89XRvRa8CKJD3jhkkBLEILoRvfZz05B+xgGq8o9/X3lfH2pR0?=
 =?us-ascii?Q?u28nkEDpPwg9i+RXDy64uL7yIDRZNMjlJe9sPiMYIgTb248k1sXwiXsYxqGd?=
 =?us-ascii?Q?LtQsKPPW5RtNvFttF5GA1Qpyc8b6yQh/21usQ0o5qGgcBxGffEWpC22QSxTc?=
 =?us-ascii?Q?fZCzPlD8vzxd1lBo2jq84KPX10vFUsoSgwabILx/KRcaA88QnB2XPvzfOS4a?=
 =?us-ascii?Q?IpawRp3IIhmGv0jqsfJHk7ZsJMHXI/mLmtHIPn9c12IpB+q3yQI65E1N8pFH?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	13iv7U9Wq4fUdtgjvLr7DJO8bkvDHG1gWojLBKgzMlGoJVj/EOBbFmF+MCTpqOzQbFPEDUq9n3dFOIpZDqpR71/nvpGwckE8I9g+ArHUvdW27Z6enRLDtUcT224v8aIKe7ZUw3/b0HBFRWMGPq01ceG8xSXOMJ28dLxA2wmkPlJIHAXbCYoOpvynR4FtsGGv6jlpR9RryGED0NH2GJSUcAceIXafyvN2fUs8obxoWDxBIg831vB6PbRpZN2A+ZAx4EfZlg2cTVg/a7mxHNkm7aeHQ9Y5QdohTWbz+iK6I7J/ex1KPhh20XGHzuafyuXTWhhVutzlShaSOqRHz44rXekO/IENf6bZHFlEeTncOJIX2I24hwbgu/7jok96YpHxB367dByCOST0tcmGMD7sUeBu9z45r0/nGviDYnzqhrCo1dROxeuuH/OzdD5stQee+955pefYJVXNRPIQGp3RUflqk2nk8ZBdU0zWUojUZuhe8eR0ffxNaiQhuzP1bpJNsRxVBLBSAu64sYjleKhneFFGwjsEe6LWt3t28Xge3ov1ukMECUvAkdxo/tBsPO+egTYXz2A2tOyXtiOkYEyFEBjMGrRxITQEH6GjMjTJLjA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0c5033-246b-4828-a2f9-08dd13901b5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:46:21.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eXiLyGJfse82bS6pH2BgXNR97AT34uXaUOm1bloFitvTAerbXmKsdxszt3ua+IQjwJF2P1mMnO+LabDhnc1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=833 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030101
X-Proofpoint-ORIG-GUID: H7iaOChZEbqITs0CPq2-p33We6tnWqdN
X-Proofpoint-GUID: H7iaOChZEbqITs0CPq2-p33We6tnWqdN

On 29 Nov 2024, Nick Alcock via DTrace-devel said:
> Fix coming shortly (before you get back and read this, assuming you're
> guzzling turkey now like you should be).

This is now posted. It caused tst.multitrace.sh to break again, so I
found and fixed the bugs that were breaking that too :)

-- 
NULL && (void)
