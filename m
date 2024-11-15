Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35B3BB22
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646449; cv=fail; b=bScqQRDpRSXyLLr80wumGCE52CBSgb2vBU75HqE21WdeHLt0eogA1YILLEq1j4bU5lrFg0GCSC9TJuJEuUjwgOn51guk9QFkEwup9JnoDDdEQ+cQM44DdEeSSuRNwJZgaIJ9WFhO2cOdq037JHwdkgQnSebfHA5QAnru5oSg+mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646449; c=relaxed/simple;
	bh=oQA0GDiqpsESqdvwosdV2gOpFsMzzzB5fC0GogmXVf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SpNQwGQp1ZhT5WkMGvpcqeaPhj/2BoBs6gHOGkV+39EtgFFlgwtXrfvRDo0Kq/fAZbZbUbEgvO9kzE0w7w4OujdQHJVvdF1GqDc0twdHY5woV2KW/dNkkPbt1ePqCQTLs6ikiEIEbCapwVASAvlhwpIxmtqvJ0bgg30Fir5XqB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BpnfMO7A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pe/yW1+Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BpnfMO7A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pe/yW1+Q"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF4BZM0025285
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=nCD9wojeAwNVX9ztcb
	W1frt5raEd5xDPJDz2ZWHiBAU=; b=BpnfMO7ALT/JnPXIRfyJ0g+SstTo+zb1rV
	fgrmKU6YujQfCBZ+G0ldJGq6O7Qns9PHDhantY0nyM8egCsS1kmMkfBo/aL+wZHs
	6U50qqYcpa5JcaXGsRgwfGnnHEYsmP+bm2Vxh0x+kKiqsDRhrRtJEpIaWgznVv3C
	Gq/jRQ348Aq4WiqRpzV/fGyjwl8xuUvvrnzvEAZMTPuA4vg20veqejt1vCzl/66b
	a61x7+/o8yC0V46bYphbUvXLBepb42Rj5XzgDwQJWqjUCCNnkqXcKN6cDc8mFtAA
	jCXOJfSNJdC+dslPXNuZO2vqNoeaReqHaIpLx6pwwwP7z4LI0Vtg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k2anwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:54:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF40ZeL035927
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:54:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6br8a0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENYNEOhE6MgOnS6+ZVluIUYaRWzkqo3NDJ50gXJxUyps7Kkr8F0Wf3gBbT1o0FBskjCxjsednBWbvrhnqv2OUODa8EgTiI1dj28BXgjagN8ZwrVfAQRRYGUCxJI27ubTlFRPLTiZWzNmCa97EK/YAN1IwZXffotw7tD+0fvP+BbnQev2OgAiq+HCScjFaFIAuboGeQQEaK2QuJfWjifCu9ctAhoAMzJhg4Gdk1fzcdTDFE0H1AVrK2dw7Uh9MOYCUIhGEREUJqQRhaSPAm60JD5Mz46iIzxczVi3Q8P7oloA+vpv4PmB+wi98H3pAV1s3Qe/V9SAUH7GM4mVkX57bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCD9wojeAwNVX9ztcbW1frt5raEd5xDPJDz2ZWHiBAU=;
 b=CI1P1f6xcSabl9tlZyEyqckT4TXFFmL1h2AsPGyKcvxhU0XLbCT/e6YnqySMT6j8y5E/hmFimqRoPUJWQCEHW6EvnKcDS5UABriUFbRqu04l9T/gTn6wB3/YLcuu6FPu00IXVJvg7wP6Bg0js0REOaVavlbJEsgcA0B8HbyIu9D7vMKKvtbcwnXT+Cq+Hxb/xwCt2pXt3YQKxBLKBcQi2ImE3tHvsT83cGkwbIKZgC0lByMOXf8cCaGnfLhG0mUwfVQvxJLjF1dgWCfsliEaA61BC7Ee53dI1GNCDv6BVAL4swb7wJuRhwCpoQZYMDdnMvmC8Z7B3FHVEpJOvFPDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCD9wojeAwNVX9ztcbW1frt5raEd5xDPJDz2ZWHiBAU=;
 b=Pe/yW1+Q3Ewr7txDXqt2wMZFlkqmYK65GAtuQYzVP6kXGVOYyVduZZ2CdVJue32pYWLL0eewV8DFg5ZSm6QsR5bFLAQYctDFnB0yEtoMKxldnIkGIPuJwaBlAZwxsztoOhfqdQKsUXSEzu44hGHXDFGA++sysnFGrdyNT3EOr4M=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 15 Nov
 2024 04:54:02 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 04:54:01 +0000
Date: Thu, 14 Nov 2024 23:53:58 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH v2 3/4] probe: do not try to reify probes from uncooked
 providers
Message-ID: <ZzbT5s0HcpaJU35k@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
 <20241114220108.95647-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114220108.95647-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0445.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::30) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|SJ0PR10MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: afe42465-08b7-4897-dee6-08dd05318602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mBAYPdnCYE7kM65Q7E/T3er0TzlmO/u5m0aiJOQYw/AfO/FDqHGD7VbM2pF9?=
 =?us-ascii?Q?YWCYx+SfCuk/tBC3BcF+0pwKHrC/ge3s96Hd8t/pcdCMbSZW5QP/hRmJbAyq?=
 =?us-ascii?Q?JTS93ZdBvTCa4lC4WM0jEuqSDkfb5Z1MaGXhNK0wuolVeYOQpipbM8uRuBqy?=
 =?us-ascii?Q?1E8U5QATueIn+/fHL8Jf9IvdWEsptJNbteLrGVLz+OqpES1o5nJFRfcQXo8E?=
 =?us-ascii?Q?aMeOKN/05+Y3KtvirJBKblwXibV3X4E1NcNz5+vgDd3EqqfOzalrK5pGu7P5?=
 =?us-ascii?Q?eVFCVdwNjQpGqnWAxVEMQFSAvGQee2kQJAKbeIqcvhjAoZVXYohOET5q2LrH?=
 =?us-ascii?Q?S+171+PSGjYRCpi95p4GKt9ykmdD/qFY41jY6exCBYVR5rKXfhtgof6sCF4E?=
 =?us-ascii?Q?qs617KWKr9UauPXGjQIJWdivn+wet/krXFEeU092t6v1aqvjgg8LzWAGxwbJ?=
 =?us-ascii?Q?RFRiLCa4zVuwgWzg1Nm9yY4YqXXWyTZAsDN6jqHXIIAG8R3olI8iluXr2Kul?=
 =?us-ascii?Q?0SpOARYezsU91EKgtu8KKW3MererA9EwjcouWWKJLDXeSiSt/bXUh0AhBpmK?=
 =?us-ascii?Q?pxJqkdKgS9JMl/T5zRo2xFN/mHv6jy6ix7RSfrtaKXPk9wrMhobODcJqHZQF?=
 =?us-ascii?Q?n0lA3Dybt3wAF2ESPkHU/9GauPc7lAmd0SIytV4GOVU/cHvnH6zdV+QM0qS7?=
 =?us-ascii?Q?xVhuHUWOODvEqc8A8DlW9eUpOLt9YfeXCw1vaBPqLxSEwsoyu8wIiIO90HDW?=
 =?us-ascii?Q?viwKD1yMSmOCbkbyf+UcSHARv5Dwk86xnd7soJX/8cDHszqVDg7gSWXzUpdk?=
 =?us-ascii?Q?wME5pkBuqlIqTo9yEnJO8HSjKKlnyT5JsfQ0XyrU3BDGGoYM6FCc1KtERqr5?=
 =?us-ascii?Q?fwZw0SnIUW+U2mhaG/zX6TorzyfmfWNuQfOnPPJM79uPJSt763MPSHdhVYdj?=
 =?us-ascii?Q?ykSyVTfiDF/X7k36T5akl1CMw4RdoSVBPeY4W1/bUMQd/SH5tJTEzUFA5CRZ?=
 =?us-ascii?Q?88l8Ik/oejNeiUHNDmkEj5sGdpgw6n+H6jH62BMT6WCZoNzDGVxys3vC1XFL?=
 =?us-ascii?Q?u2EgoN4gUkpxklgGma3iNbh3dejyqfKdoihvhDffp1HwIjk7luuy+jhPIMUD?=
 =?us-ascii?Q?bBr3AMvSnZ46mJUHBssokjWg1QJOl2CZGVIFUGwaNMQJLt30sA+wGcoIZxjq?=
 =?us-ascii?Q?Z6UMUYqXwld+29ecmig7vA9omLmUXbqDDSSFv7VOjtshhbqXlafFjFPChVVQ?=
 =?us-ascii?Q?2AYuBXNSRP2a5xrnFx0KLsNPyufOUys5zheNJOBta89d5jLzVefMN0viy+qv?=
 =?us-ascii?Q?bmSvgKm8Mf/yriUQ6jKyx7/e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n96CIEwsvcFbxJ0z+znSoU3eQB/nwHQwrFNWkblT0gZPy2x2Yl1u49JZpqol?=
 =?us-ascii?Q?SFMqapXZ11Th0nykeZgRDs2HUkpNLYFXeJvapbYUqtPyBlh/CMvJ1/MR2O1y?=
 =?us-ascii?Q?zRf6ALU60Q1B6v15hp+ZXfs+0Zkc/oj62etK7Fz9O8XGmXTMUqYroKz3ANwp?=
 =?us-ascii?Q?SRBk3Fz5nV+qOhHYhVz7MMEaizbPpOpyqVyh1OZdMmP+n7fL3PTy3fPhJxSf?=
 =?us-ascii?Q?Lyp0MoAvj1Rbl76NItX/v4PW8PKxWUZTwgZqGFILmNaYMr8+yokB+Wsa/2Dm?=
 =?us-ascii?Q?ycKpbQKdAcq1+iCB3Vx04Sp8lu6YVX2jzEFpLQZDyAc4QrWEIOfFs4GdK7be?=
 =?us-ascii?Q?7WlSujuCoqbxD1M65AB1mNEBjR/wk/Oyv5DfjwKyNBQhSn8/1nE21yXd/ER3?=
 =?us-ascii?Q?InCF20R7lNjd/hMeneroKo0YRoVjkv0hc9qVSh0p7xrgtpForoSdN9o05sOV?=
 =?us-ascii?Q?X69KZnWIh7i2rihtSzpKkDVbshQoeoarrDv4HMg6J/ZlCXost8b/Pj0RilbR?=
 =?us-ascii?Q?QkV0lXIvVa01S7E85XofnADQFYN4m/HfYVGI0ZXrYH4fsYCRpwaIq2zqUjio?=
 =?us-ascii?Q?vtrkjOKdnR3DRwActr9cEZD8yqdN+WEzmKRgTLl4CW6gHNGsJ1qpmnIPHSIX?=
 =?us-ascii?Q?aaurjQoWB0v0WdQnsRXFdr4iQr9pTAD7zWXcb1flgjYnlrjewE+ZbP9wTo2/?=
 =?us-ascii?Q?X/gyx7Q+2y8gABkdzqrcEWyajaE/1Duuu9eNfQ/2CirGX4HXkhMKBLGh1VMc?=
 =?us-ascii?Q?M7iCR1kASmdGsVPFpQuYipJ59I9e32Ta8WeQKfqW3CBuwvMQF0Z73bZoziTV?=
 =?us-ascii?Q?QcsSJshHT178gSIlYn47ODhsYr3NsG5buSAlOvowE1Bj3yDySVUD/49UG3ym?=
 =?us-ascii?Q?Pf8heUgD/DwcNiO9sHHR28zuemWvuqhJpRkLiSnyKveVLgm5aay7qycozrVF?=
 =?us-ascii?Q?IrNrMOT+AxdnGN3Ha8vAuUSyLb4d3Kzb9YatSRWQIuvMulGtWj7qXrqancmF?=
 =?us-ascii?Q?OwXHNQpxCzH7ZGZwah4jEm1+NVEj6UTGqdb6qYDpt14S/CToRaLoWy2bASCx?=
 =?us-ascii?Q?qwSEBoDvSjK458iQqvEwiLJaKrp9f3Cl54MXBxgR7yMy2UVPbfYuDAFCV7Y5?=
 =?us-ascii?Q?0uc7/8J8L/ZFOLpLfsXaEauV9StCfJXNioA7EppwT+SIkOtuUUlNONCX3Wx0?=
 =?us-ascii?Q?RucnzyAfZj6sg4nD5sYC7aVUWyZvTsIgdT9evStRfZe5wLNAdY8J3S2m2/2B?=
 =?us-ascii?Q?YezGyrdjnIpyfh8qbpGD2qGbMCTDAoHzm5Xce38XTCH8lRzHzgzIJwNjBS0C?=
 =?us-ascii?Q?gALQ2zBnQd+JhXKRx8skWlJyZHLXA0rAfUoHoVRLQORvEAd0dTuvXEPCkr+r?=
 =?us-ascii?Q?FA0PuwKrReO41MwONP1D6MaGwh+6Q7Ocuz15+0QPLirDKSJ+uI3dbLWYqAHP?=
 =?us-ascii?Q?E6/QyhZbDIGP8E2p0F3oGCGnPRyqavRH0wnvrG9T4dlYj2A6G+BKQDTAH/PF?=
 =?us-ascii?Q?kCRr1isgK0Dap2vDRckFg0tDy03izfSIu9jMpbYPim3YjYkZ54ryORElihzN?=
 =?us-ascii?Q?4fRyu6v4gFs6hT9+ot2NVAi9HNFXgfQvdTP/xrUaRmBpBuL5XrjvMLZfMlVY?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9oCmLUc9N8fA5WIJkkwbijHCu+xKeryDjkKS17htSIgYvHjmXvnNJNDbJjRw7pLpGVVYDdynCQfvxeKLMQWDMT0qF4MtQ25JIqkTQwjrD814A/kDEH8vqO7DfwEd9dF0qx4jGinrZt4IvGzWCMUxj91inoJlg2T+Jv5IvXIRFmKzF+XGU+aue9idxiHOUhjVcjR7C0W8CfWbB+0yRfnmk22naGmkFf6eSoGfn4psQOdrOrbTfEOYFRza0gYJq2eqUeCAoCndVyqj9yILPM6M0BqpEBH0E4YyVtHHIr7fn4Z1Uup7wFVygPVkUr54ed72vy9Cw7J3iEGic4PZ4wJJIdCuN1hOSTfN/NmOMv6AXjh4+YNnsSiVoiM5cYdzGzlXKZdx9ANeQ4BcKRxhiEWJntqhLnRRYMW/qKzAZGZWRyp1rTZOv5lh9U7puq5pR0KinM7WltvIhWfdw2SkwhORphD+X23V4rpa8BOdKBpTszAwMpYmu429ZDu2VKjwCSHXtinrCIjj9IZmArcezwqwKW3WFlX2p9sfht3Iq3SXOPwPfPnkuTkEAc30BySzUCh9w6T/shf0vlakD5t17LMGktckALQiVGpVP6Bfi008qDY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe42465-08b7-4897-dee6-08dd05318602
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 04:54:01.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNWYs+9Fi/f1ozbQmCKlv0atazz6VxUvLUgElS4F5MBF1JrLkv0EGp6+fuFot08r7rgBqQ4P55iaVlDgwvWhgT7qhyzftkvkrT0fXO/9AmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150039
X-Proofpoint-ORIG-GUID: GQRVJha8vcja_Hb25XX6K0k9YPU2BScd
X-Proofpoint-GUID: GQRVJha8vcja_Hb25XX6K0k9YPU2BScd

On Thu, Nov 14, 2024 at 10:01:07PM +0000, Nick Alcock wrote:
> If there is a syntax error in the middle of a .d script processed
> by -h, we will be left with a provider in question in an uncooked
> state (where dt_provider_create() has been called on it with a NULL
> provider by dt_node_provider(), but it has not had its provider
> set yet by dt_cook_provider()).
> 
> In this case, the attempt to pop the parser stack on error will
> fail because probe iteration is attempting to reify probes out
> of providers without making sure they're cooked first:
> 
>     at libdtrace/dt_probe.c:1006
>     argv=0x535830, fp=0x21e4630, s=0x0) at libdtrace/dt_cc.c:789
>     fp=0x21e4630, s=0x0) at libdtrace/dt_cc.c:1419
>     at libdtrace/dt_cc.c:1441
> 
> The fix is simple: treat providers with no provimpl just like we do
> providers with no provide() method in their provimpl: they cannot provide
> probes, so don't try. (Test coming in a later commit in this series.)

This entire commit message (and the one-liner subject) are actually not
quite correct in terms of what the problem is.  It has nothing to do with
cooked vs uncooked providers or probes.  The problem is simply that the
dt_probe_iter() functions calls the provide() hook in provider prior to
trying to match probe descriptions, and that cannot be done for a provider
without implementation.  That is all.

This also needs a test.

I'm posting an alternative patch (with my reviewed-by) with updated commit
message and 2 tests (signed-off-by for both of us since you wrote the code).

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_probe.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 189bf7928e145..ccaa3081c5b23 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -1007,7 +1007,8 @@ dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
>  	 * Loop over providers, allowing them to provide these probes.
>  	 */
>  	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> -		if (pvp->impl->provide == NULL ||
> +		if (pvp->impl == NULL ||
> +		    pvp->impl->provide == NULL ||
>  		    !dt_gmatch(pvp->desc.dtvd_name, pdp->prv))
>  			continue;
>  		memcpy(&desc, pdp, sizeof(desc));
> -- 
> 2.46.0.278.g36e3a12567
> 
