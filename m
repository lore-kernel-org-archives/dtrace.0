Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A53188CC9
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754072545; cv=fail; b=uLDGneFxY4HLAJXF596amti6PlA9hTOZL1GfB1k0sXsrQGtq34qYC8KPcxyTamiVLWGhE+mGHweM2bXZso2EcAI2Bzejkebtb9wJU5HcLBs+3QSVP979GoaA+sKV5SjzZr0ePgHqOzJKCF9Wksc6Z9lODXJFujppjz7N1seGZbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754072545; c=relaxed/simple;
	bh=wMGeaWIKwy23bN7zut3uVbjbfUbCB4/gWgKsli+7uBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tSHnQIFpv5Z73V3ypb1O9jI9fO+2v8//Ellrth8kK48NTlv3xkduvbPWN6kFGXaGuz9c38TfsI8+IWZOaK4DS0sIUOP0EMIqQhz440feg87d6plqjG1xywypJ6MTliJZKm9t/v6jCPOMJoVTEpoF1tPdc7+jPoUPR8KP553WbAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TBPM0Jk+; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XyXy9mqS reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TBPM0Jk+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XyXy9mqS"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Htp0q031121
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SloBDLPy/VBB86Jj25PxUOc8VIj3XbU/9vchQ29w6Hw=; b=
	TBPM0Jk+Lws5Y9/bwBqab6iFi5FIhJr+3DbMuHU9ggBcwFcov7OaYhB7VW9Ur1hv
	O8sTHSzXTd8iiihU8zfmlYiDNPi8Yw/n7+MaB2JFl4dX3h+xuFaXvpFdLzKJuUGi
	q+8WCKW53zKeteY9jw+B+nh042S4sNOyDHwz2675uZXn4zAz/uLkCEWepjfsXehj
	UrlgubGRXUc0zq7f0OfO3IEXgVDRnT+HH8seJR35uxbobj9F5M6nxItvMa5orXdb
	oTX24E7bnEy2qEQiF08aWOhYcNDzFWfdaMizBNjywcFEfuRrXAXpQ84hd5QPraHr
	Yakhu/Tx3H0fVfUHVBeH7A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4eextj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:22:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571HUYON035143
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:22:22 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfebg9q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXz89TVFYgq6DkLou16uO5CNSub44avTAFAvs97bHmvvf2ds5erPigyvsvoTfmho027Zt3doG2/AY+y5C0wdXrdTq71byQYC3QaKMgR1cen+Ntq1BDZmsrdWYDTwZJKYOn00IcyZJvvl57si+1+bdjEKCpIEgYnInmtxcemMcsHq4SJ9dPrb4UYvt+KHv/n8dMhALL3zLz6go/KrLVI4tNeRAk3euk2jjKBGmffji2YlbODy9vOJ7IofkmBH+Z2dRmw/rMVhwAjDYrSVfmqlOPd/P4E3a5z23h2RV4BGDmfry+F9gZ2qSTQKXeGXNbMSgV1dqLBszelbhAcJ0cykFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjMbmrFO1OdQxyfrbF56guqCY5bMIgGdh4pdBaR+ll0=;
 b=fcKvzJLkcNYSA5mFrMKLdedqoU6KST2Vd5OZWpG0PVTu5bjJXyC2we10JabZ+zEpZBwJXouDTdHkGRjis+RaBgl4LO6I7ek401t9kzJpkkAxub5GhG63N3QMHvUULpBNOFvZ5ussEGh8sxXVJWjVkwkFNwW6n2+YHg4LcWIAtx5HDbW3Ty93P9eD8t1Zcwd92Uz/DKdcaS0DcJK6osRbMEuzqvMAY5wFuDlPu8loVEtCkP+Gouz3bpNDzv8wdRfMt9KMcVsrwU1EDRi6IRag/Jl76WRr+5j4AbWMFH8U9RWXi9C4wJJNZnRaxih9GPVBpjOZOk3OjJlX8kgYiZRylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjMbmrFO1OdQxyfrbF56guqCY5bMIgGdh4pdBaR+ll0=;
 b=XyXy9mqSEMyg+puGNnP2cFpOkBRbIgeDqrA4/AaY5KgoHhhiP5bGoKT+D3iNEekEF16rCJfrVAypzFfxohFJP8f+QIsBPstvOzn9vZ+u6xpmGEdR15UvBR2bhmhf9nLMBwYhOpThwo3d/OBYV0EIzzKvt3jcOSB51Rc0U8tdO7U=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH3PR10MB7647.namprd10.prod.outlook.com (2603:10b6:610:169::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 18:22:17 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 18:22:16 +0000
Date: Fri, 1 Aug 2025 14:22:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Message-ID: <aI0F1TEE1b10zbVP@oracle.com>
References: <20250711044024.1587-1-eugene.loh@oracle.com>
 <aIze8ZQ2iBFSf0J5@oracle.com>
 <65fbbdeb-54af-ff2a-cef3-ebf019f6393d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65fbbdeb-54af-ff2a-cef3-ebf019f6393d@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH3PR10MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af5bda4-c442-4069-6a87-08ddd128582e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?kJyKSMBUmCVFSfmQ58WglhlsgsSTmyFofw0yCLEujDIAXeLfkEMmQZSayf?=
 =?iso-8859-1?Q?A+XI6g1Fc40g6KqQ89F+P3bgfruSnSKvmV4cwcDgWrwF+5BYtdhm/ADnvF?=
 =?iso-8859-1?Q?7BfoqjVUaUh2UbCVstlR7om/l6M1WFZr6VLVaS2q4BNm1FOL7S3sTRXJFb?=
 =?iso-8859-1?Q?jHlT3KY/PQHLz8+u9g7utDe848rEo+tY/aiJGefwZBNTbzmCx1HVy7tsh/?=
 =?iso-8859-1?Q?RChE0p+59kFZcasuOurbXzHQD8VYinCGtHpdmAvYjCoB6W+bEvV68RzZRq?=
 =?iso-8859-1?Q?PjFe2mgYQG06vCV1e45C0j6jfiqYderpvzKmdhb77aQG2NQbgHR9ojgsaK?=
 =?iso-8859-1?Q?EE1sIRNs5keNiwUJf/++QLCK3sbG+4w05zryqBqCr5wExx9nESppQcHw28?=
 =?iso-8859-1?Q?OF80ASqHjqyBhIn9JYYzzodhx1JoG4qxd6DVZl5GNaEpbqOeBe7ys1+n0O?=
 =?iso-8859-1?Q?uIu9aTJPjLtNslmqWp1s9hSqus4ayedWDVqTGSXRyZvDocbz4zeOY9o7Fq?=
 =?iso-8859-1?Q?Zpvwpjo7wvHfjABontDg5dg+nudS+m/07f+MBBHJY4imsHp8StT0kCKX8G?=
 =?iso-8859-1?Q?ePDOQym+ZuG6HimqiHFJHm3txfxpD41hXqvkajAIIKMTFv2GQESDAX6RNM?=
 =?iso-8859-1?Q?s93ibZ7DNSqChrXece/zlXMkBRW9gjPUdeWhZkItazftxUIuACSpgSWv2v?=
 =?iso-8859-1?Q?o7B7QBlU6yVG8GxZ02N1Lkc0jY9Z4xgZAaT/SDAdB8RDlomPGpieykuy99?=
 =?iso-8859-1?Q?w7JfKZgl5vR80YwIRsF0Nxj1LR569LNoIjlyuwVbvwWUaD9W6KgVoH4Y5r?=
 =?iso-8859-1?Q?C7p01Vcxgfc9ub3AmSLpn3nQSha8GCqZ/jt8E7nGb6XS4xq8oeubg1yLTx?=
 =?iso-8859-1?Q?iSuxm70AMRU7UcdcKEG2QdcOEzBOWjpXtWmUx4dKFFI86FuXeVujPYhHWU?=
 =?iso-8859-1?Q?Y3NZmM12VcN3qDBLLXhw35IigbE7Ar8+BYbaiigYR3Sd8tRZNjvwg4zEGr?=
 =?iso-8859-1?Q?qoeHUYQH9Z7/1TlZqr+7580r7jKtbtzQFXK4pqy69vX/Ty+EG7g78gTufR?=
 =?iso-8859-1?Q?bJWiSwTFqzbOJjyBuOAzErEuOi1g1AuRZva7jknymvQZ5g20exqbfvJYir?=
 =?iso-8859-1?Q?3pOTvOGoyMUm8zyStIH7eQXuGRnFa6GYNKO0uPIozkGANYHTXp38TgVgY0?=
 =?iso-8859-1?Q?RX9VlApD7TNrFnR3KtujCQjVwMhhxfTk2U6kJ5XQt+qQ22be7fYwfXA9ki?=
 =?iso-8859-1?Q?WCppyF4ixLg6oTNTb2isHwCvgLgHEUrdaEz2Gdms7OpX8J8QdRUNklEstY?=
 =?iso-8859-1?Q?n4WqBhjKzgpGiBprTpYFfhTm1OaEoWOXSIlbGH4BY4EXm+7PUhRaQugJ8y?=
 =?iso-8859-1?Q?eMGlWFgdzmaaQH3+CrL6nj252CmGa8Z8ftYVSzlo+hM2OrRwal/oER8SeA?=
 =?iso-8859-1?Q?CGzEgSGpwcNKVmVYiNFfZcnsUC9q7DG3ZOzfqVe05yPyDUej4Pkdf6S6JS?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?vY8ArDNHoxzQ2WQwSjzor4K4susy4yfCNqnOWvO1t3ntAPUsG7RS0tMqY3?=
 =?iso-8859-1?Q?GqapGgQmwPz5Up9vcpNEQzLzb9QTLv77FSQYhHL7UvRzG6ERyK0Dgaf8fM?=
 =?iso-8859-1?Q?2Qa9fKGZfejuckYAXnE9o6Niuu+ppMcrrNXQZcnMSd2B+OdizKykxIxnfL?=
 =?iso-8859-1?Q?UWXU5Ry11lxjMiKX4t2DT+HzrvttiVJCe+WLSaHDf5hWn8HMalSeCKqJf2?=
 =?iso-8859-1?Q?f19OT47LQIOTbbUsOF347ITPHygbTCjR402iVLPPsxO/Q+ufOjinZ8ZD5O?=
 =?iso-8859-1?Q?p8TB7rRMKEu7TkXBvFmmy/Q8lscN7YiQNnT7bS3uHqOCQV0iag0dOBof3c?=
 =?iso-8859-1?Q?2jOH/tz/FSb3ydStSz4riYtNkRQFuLmtq9r9nTmyjeXUsX/8Alvy6RKQSH?=
 =?iso-8859-1?Q?ltVXcAnhCORo52PaveBzAKpl14iXe5wjRpuO0onrvtqZHqUx+dAfAaVaaq?=
 =?iso-8859-1?Q?5ioPGEoRkX47mUDtCNAWtdl4aQB3PmqtNxZInIR1ot4CigbJoygjc7ALf7?=
 =?iso-8859-1?Q?MkQJHzVHibj1BhqVfTYXMPKb6IFAyNjyK6Jn+Z/lQtZnqOyzyPmRUD5J8Q?=
 =?iso-8859-1?Q?gyJqmiHHc3jTbOpGJXiugnxfLnNCkqZq0er98m3iXfg+3ORxngdAhTWZdM?=
 =?iso-8859-1?Q?/zkdRTlfxMPkMrRZ6sA3eReMbn3SHrAgTC9NXR9pZCn7e/XpvhVLlw7eRk?=
 =?iso-8859-1?Q?OOLfrVHHyx4bwmXZm4zk8hN+7Fn9gQcdoXk1Etvv/2Oqdj74rRC9VNF4En?=
 =?iso-8859-1?Q?KyzyntBe4wzzNFCD6Qr2SS4TWU1BKvUNtBHjaWKBay6QRUUCrJAoMLG7Nm?=
 =?iso-8859-1?Q?4tKvsJydUNNAC+/UmXf7pPl3lxIwIpMPTew15XvEv1NmClKWOWylcNgbI3?=
 =?iso-8859-1?Q?wPEZVpboPQTCwee2F8N5PWJ1nJH8bnNpHOPYP53kCvDRPks9zTEgS6IV7z?=
 =?iso-8859-1?Q?88o6jicySMpXk3mqnwDeUXcIEsdieRjDcOotOegRsCY1osAm+Z+vnXLTO5?=
 =?iso-8859-1?Q?mxXQ3qLgA6NjuCVVzWcu6L6MKvQpfiU+Fp6mCSUqr5fKo/LbDDCXPPcLMn?=
 =?iso-8859-1?Q?tV/9wmx3IXKnQvpCW8DpaFZYrvL7rU3wSrd7pZKomUnKxxqN5GkHwR0+83?=
 =?iso-8859-1?Q?U2lZwRRJW1ykPtNRaolVfOYWgYMWj8KCbSM6wvdesEsUOiK/v2FFbFH2+4?=
 =?iso-8859-1?Q?/NCkfJKbnHkVqNRVSfgpixmVKfafPjBUnHo3KPgd5LUBmJShbNyqScAqUu?=
 =?iso-8859-1?Q?fvFRe9FT3hBAwwmLo/AIszl5Bk0oBmewTCV/b9TtmlTyllob583mWacWVU?=
 =?iso-8859-1?Q?wbOP71i2g8vXWR4GrYnjE72oEyJUuMnLoiL+jOUvN39AbyrHyQCgw8Cjy2?=
 =?iso-8859-1?Q?XE6GeimPvJ2u/gODcKxoK3w6jtOovG+dkYYM3UwoWdT7QP+mAIDV6pcQwT?=
 =?iso-8859-1?Q?1oG7TNkob0yNoa8/qKkTNK7Bx9Q78NqwhpAEyihJ1IxLYBWDGVYUFmq5zw?=
 =?iso-8859-1?Q?fBqSjm7R/0DECUaz2QJZZP9d5fdlRpt6GmFCSFj0ecquxOwQCVLfHnQkP/?=
 =?iso-8859-1?Q?rXDxRKNBBN5xeVo8xmYO766qczzU58udwkmO0drbAXUauCXK9g5jTorZGr?=
 =?iso-8859-1?Q?godSSzaMn0euOmzexFcnh6jphyEX8ViPbr7HmmIO142R7ISuIkJDrziQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S8CKQj0blVmcUZTOuNW6HtieqNi74i+Y5p86rtraF4qA+xIwhkFNA3yL8iE0AhImtLRfDqkenWAqjqNXRFQ6W+vDttC7aAWMuaNhvfmIp3a12F4iV9bOZ88pR4Z4c57EUN6cf3IwLhkAjpBbjsiWOcHn1c1HwXyznhx67GXft3Dy+3xKOLP33vhdfBEamfw+UJegySM/H24y8EzLbdOzAhxPViqTJ3/6npC8ka0rKbFGsYxdnjTbr2RmzoZk0MmDZ+Gjg4mKgLHe+CNtn0sqQYvD8JplbdO27kJBGYDlIj3Yr6rUNlmWEhAFQoleOL01xHp+3zgTC9ZRTWp8TyJBd8PeLOzDGH9s8lWeVhnDZ5jGKRkTfEOL64JVG6rfjyoofIwR8G3b8BaKglJBkyUA7ojExY08p1cgiTqzDyDmUgN2NTkk34wQKWyz/zhNEU/SvMQ3gEtxUTQ4WGPJW64NHxw4FwGwtRSFoP0mYQprD5R1fFUWoDAPbpaP3/OUY3l7kJY2/QRlxgAzWCKJVaa0d3WCcPn55vp1mXnkxf1hy/Qk4ze1DR1lODsIQpUxzBj2vBNDFGBaWzqHPBUAV4DwpcCUWkSFMuuLX+WQ2w+jjJs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af5bda4-c442-4069-6a87-08ddd128582e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 18:22:16.5800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8i23mZ3mkDb1U9x8//6oA1xVbp2p4eBv38Cf8Ljb5WZ7MOYuS9ASIQTIKpxoIvKd8jqUNKykCFHmiUfW1x1qZdzlPkZS9348UyxME/6mStk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7647
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508010144
X-Proofpoint-ORIG-GUID: zaVrqoWYzDI_FE3TuQPRJ3bYd_-Udb46
X-Proofpoint-GUID: zaVrqoWYzDI_FE3TuQPRJ3bYd_-Udb46
X-Authority-Analysis: v=2.4 cv=QZtmvtbv c=1 sm=1 tr=0 ts=688d05df b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=Mmbq41KbNJjmZ6uhEUgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0NCBTYWx0ZWRfX4JuARnrMyTwj
 7U6VtfYgVXulQlS5hCdguThL0VFZGdkm+E+Fo+g+KTRMGtHZhr7LHiwQuY4Db3CNfkISrSkkcpX
 xbkBArAXrcpilolEAwlV+m32C9BlIQ69gcvUhSZU9oCVb6rOD41Pc83vb9fDyDetkJII3Sp3IX7
 wJOS+wVY5U6qlyfOywMrS1BMOAjKssgxGtNr/7M1KJHh0ZP6RNgHgjqsp5KdZASvmwnRyvtTm1B
 JABbcgGO9QdnXdcp0B5aR7MO6ADpZlpOjSpmsWbN1jLWGlYYIxegH4wXGNY3a2IixDoLIL3rlzo
 WVLaTPlucqcZ87n3G0A+OgvczgFjG6etXtWowG8gcbMJMApPotFaduyP4ay1DQV+5cveYe20G4X
 R10hmoJ0zRCY6FgolZ56zOHsRLZgW82nSPOwBnr2ssn6SmNxcVgllzHG9Nzi45Uf4CJqqGmh

On Fri, Aug 01, 2025 at 02:15:18PM -0400, Eugene Loh wrote:
> On 8/1/25 11:36, Kris Van Hees wrote:
> 
> > On Fri, Jul 11, 2025 at 12:40:24AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > If a clause includes a destructive action but -w is not used, dtrace
> > > should not start up, even if the clause is ignored (due to -Z).
> > > Solaris treated this as a runtime error.  We should do the same.
> > > 
> > > diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
> > > new file mode 100644
> > > @@ -0,0 +1,25 @@
> > > +/*
> > > + * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
> > > + *            even if a clause will be ignored since it does not exist and
> > > + *            -Z was specified.
> > This could do with some rewriting.
> 
> Sorry, what does "this" refer to?  The comment, the test, or the patch?

The text of the assertion.

> > The issue is that DTrace used to always
> > load all tracing programs, and the kernel would activate them as needed.  We
> > now only load programs for enabled probes (and with -Z active, we may load
> > some programs later).
> > 
> > What we need to be testing here is that if any clauses of a tracing script
> > contain destructive actions, and we are using the script for probing, then
> > an error should be reported unless we are allowing destructive actions (-w
> > or -xdestructive).
> 
> I think we have such a test?

Yes, I just don't think that the way the assertion is phrased well.  E.g.
talking about a clause being ignored since it does not exist.  The clause
very certainly exists (since it is in the script).  It is the probe that
does not exist at the point of initial program construction and loading).

> The case being tested here is where a destructive action is specified, no -w
> is specified, but the clause will not be exercised since the probe does not
> exist and -Z allows us to ignore it.  In this case, should the script be
> accepted or rejected?  The patch says the script should be rejected, which
> was the legacy behavior. (People familiar with the legacy implementation may
> understand why the legacy behavior was what it was, but the question now is
> whether that behavior should be changed.)

Yes, again, it is the way the assertion is phrased that needs fixing I think.
> 
> > > +/* @@runtest-opts: -Z */
> > > +
> > > +bogus:bogus:bogus:bogus
> > > +{
> > > +	system("echo ok");
> > > +}
