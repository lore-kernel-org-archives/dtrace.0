Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28822264B6
	for <dtrace@lists.linux.dev>; Thu,  7 Aug 2025 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592311; cv=fail; b=t4O6kLGkXHWdPTSBl/3K6heSsemqfY3cVRkbn9de36fFlT7Zpevyx57Pg5JZzegc1SG97/Tj5cnh+mr0YLlplzaQyJ1PRt1OBkyr9tu2cF0XC4nUOqeoE19A27WDEZ2ah2E4BYFJPtXkJIA4osB/8gWx5lw7pq19pOBKsztnUoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592311; c=relaxed/simple;
	bh=k9tLMGJfEjbHC9N7SZeDNTCSaGatz0U21yQu+uyApgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KeiuicQX4Wok4xiCVgT10FneBMj6yGQlFYfR9+HsxV8P7J4UcioIzcJc1eacHQu5Hk97qY5k5S4+AkY6u51OwqwpuHo8A7WHP8jbMcpEfAMZGFrc9N/y1WEizAEDJePY7SMdyxqunknlcXGAd9EhG/LCfnxAgCfz83iTVzg0/Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S8/QUsJ6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wA49v7v4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S8/QUsJ6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wA49v7v4"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577HC7I9003065
	for <dtrace@lists.linux.dev>; Thu, 7 Aug 2025 18:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Fk95kfg3q/PmhEQF4t
	eQoFi2sYH4ezM6F20a5E3R64A=; b=S8/QUsJ6sYfrpdChTsXlyFwRBQklbG/j5+
	0NgS6nmAutCtpIV5UbNUVz1xKELFW5Tt3BGhTWOlKyzi6dJtbqmzZ6KgIAjiTHSE
	PzzuFG8X7CN1TFvyRATqOyiFi01zkpQgtU8eH+z/W5PW8GwyB/912rgqh3y6+I29
	897GaeO5MQd6jO+WU++stJF6+ou7hZ/7405JtJOyhJI8LrdkY4eJsc3uv3HtxP98
	dArEVlCTxC3BJuTWbJE0Nc2o6WUedB8G+GbwUnKn3zy8uV5pnx2zqENhyV27OZwv
	GuoDenNlcUfHFvzmCwiwo6qtao7DQn8g6SWVOWA8Sb1crJbm5RWA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd4vds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Aug 2025 18:45:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 577IIX8c028233
	for <dtrace@lists.linux.dev>; Thu, 7 Aug 2025 18:45:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwp1p8f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Aug 2025 18:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMGUDe0Amn9ut60A1CeV6j2U+rlCRCzXmaalfDPA24V5qgNUHNTgg7ZDSPCrz2sbzkEE2lMoHyAVahL1SYwKV1YPctDaOQ6IuarJMWH5fpmQ7/8y1FGdPE2Mqo+286NkzkzutDmkbIbxjZH5XaIt8JlLha4X6SKanzbA+FrAHEX499GNFZnP/98890uPxlOcO6/MscE6J1QxJ7Y/BAyr4+hCM2hpntN/DP9e82Xfz29jdkjBVWc2qmImeBtBVbDT9fJzXnJ4Xrib4cCSUFHv7tarMtk4vuT0unSPMHKoO/MxbtIeNir0xuBKGS3PiqCGNmvibujcad7/pJ51SdqJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk95kfg3q/PmhEQF4teQoFi2sYH4ezM6F20a5E3R64A=;
 b=HOxGgGLg96BXgyEN/dv6dqSHhVusOn++4wweAUYQznEq9JyueJDMaDbyIdP3SgGEvmw7KDVh6AxPPX5NGUL88yUFf+Vhs2dcbxQ8yUm74lmgLw11VLLHvTEJFWtNhuG6oBRHcV/zT5rEytcmbDnloofEXw5RR2z7QsTTocGBJCQ3Hdp5Dwpc/c/ORFb8K/emgtzZ1jDZbBl3A11Nrlv+GttDziWMIbb2eRVcOwaoduPwQ9O0fe34xp3p2E6Z2O1tZt9yQm2BkAKUgBX813O5USK+tA3i8eT9Av8zNrL9jKfkCoV9FxpV/ySVDfWgmsZQwU6bS2KJSl+ykqq4Q0YLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk95kfg3q/PmhEQF4teQoFi2sYH4ezM6F20a5E3R64A=;
 b=wA49v7v4Vvv6mn/obwachhLF2f630wxkb5e1WaNKNZELY0aWvtEB40kK2+9Trlb9kIVZrYoUN90z5DJ0uRSbDa1BhQfSWyQvgIKJbpb4X6eET+pswvXwc4Qj55Cez8reuXVGpl83tZvatpj9930dovZrvtobQoEpwA9sFmC10T8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB4928.namprd10.prod.outlook.com (2603:10b6:5:3a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Thu, 7 Aug
 2025 18:45:04 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.017; Thu, 7 Aug 2025
 18:45:04 +0000
Date: Thu, 7 Aug 2025 14:45:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] Snapshot aggregations just in time
Message-ID: <aJT0LSa/5t1ZqSc7@oracle.com>
References: <20250527054313.4849-1-eugene.loh@oracle.com>
 <20250527054313.4849-2-eugene.loh@oracle.com>
 <aJQdPmGMyn6hEeaV@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJQdPmGMyn6hEeaV@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ea5c7a-09d6-49a3-e4c2-08ddd5e285db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Qq2FLsWr0t4+NurZEgYBlpNiArsh/Vpo9jCYsQ52Kby57izmM7J8nTBo8ch?=
 =?us-ascii?Q?rgiEuN7OzvKaibxI0/1ip0/r7zQFZGagZhncJ+PrSRynRZshNN4Uxauz1Qqs?=
 =?us-ascii?Q?p4cij72y4xUMxDATqmnLUeoWwGrGdqRybS0h49Qt3mKsbpqgcSTklrQViPVO?=
 =?us-ascii?Q?CYRrVCGRHMzBa0bgN0Pde4/hSVSKlCv0TB8PJFHxozHCuhX4LdVl1oHiSJli?=
 =?us-ascii?Q?YTJMiJ3CP5WtlsTbWU4vEHaD0uyIygjtF1bq4FBvELqnfz5PWedurvm39Hf3?=
 =?us-ascii?Q?uhFstN7fmR/hfUthpPlsfH5vQ/vBLT7JiJ/abumPxcPoQ+e+oIUq6xd6dfWw?=
 =?us-ascii?Q?qw3NYINh7N7jXZX40KOMauoAr2iZaLOYUO8d1rObZCtHx37ocmxR71RIXpaE?=
 =?us-ascii?Q?GZDUWsfQv09SEVNmNQIqbwDOpGT0Ubl/BAQPbB/b5oUw8xOmDhBxO5YV/c5P?=
 =?us-ascii?Q?spGNBcVSoQbiqeuGKIdM9K3hqnMXiSRa9brpX19BX/9lTZPZyKk9LcWqh7IW?=
 =?us-ascii?Q?3zZz//FPv8aQJsDB3HN13t1OMf88HkhmZ9F022qJlNfZ1euE89l55t6Xuyl7?=
 =?us-ascii?Q?c1etzPL3EwSfdxkT/2kxWrF3l2VhNiZcTJYuKUfOv+90Mw3qfFr9geh4YH61?=
 =?us-ascii?Q?cW6jINmvrgKv9NgTflplBtW1sEJBy9N2tis04xRPRHSfVI4iaMY41kYLaeuw?=
 =?us-ascii?Q?K1dc29RyCz85Orv/RPir6Dk32zBd8yvF7otf04pV8aimiBBbJw/jRQC/tBTS?=
 =?us-ascii?Q?DBtjntYoHJUXZID/bqp52BjxwM7ZwFDymXmoz+M1QW60ko/ejFcHAv1UT/Ab?=
 =?us-ascii?Q?tzl8Fuh5JohaAzmXOiEUL5TibyEsyRVSPkSiNT3m4wesLCHDMFo8ZDUygA5Y?=
 =?us-ascii?Q?VDh5Ro1tHtneGeiS5bAEcUKonph5gSR754Ues5ZHNoXYtNSKszlgN0HHw3Uu?=
 =?us-ascii?Q?Yj1y7uhysXHOBHk2VKk7HBnM3w101CWvtkY7dQ0rDZapTx/MImjfYgEjBVUv?=
 =?us-ascii?Q?csn+hl6D9sXTQS14ZzN1T8xi8wVoctgNDp59ZHPDRRNfJt/HD+EKquAvfNpw?=
 =?us-ascii?Q?Mti97vJ+L0xbICPBmM3lzi1OKJ2j/7eJa/aDfBBH/WR2UphzTnSEJ81DnwK7?=
 =?us-ascii?Q?8Ue7pojW2mBX3wzpbJHzpnQ/y27YdtosRz/udDE+x/zctXES780fYQR8o/jX?=
 =?us-ascii?Q?3sVINtqdo/QrpjRrZyAce3xky8rq3IiFbRyadgYSMvJyq27D2BPFXHbe+D6R?=
 =?us-ascii?Q?fgj9GZaRhl0pfvwj9GXg1sID5b1SIzQkxlUbDYgohphEqG6TcQNmVY3zOnxi?=
 =?us-ascii?Q?U4RO7bXlKzqmeebdX7f4TowGNSQaMZ3to6XqOBLys3U6a8VSB/I6F2UL3T/N?=
 =?us-ascii?Q?Q2nyj4qBxelCGoBj8ejU1YFAQpf70Njh/D3b0kk933DGxqjXjgn87gn/172C?=
 =?us-ascii?Q?yCBzpS6QwIg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6BNLpBqXNfJ5SWQGkKx7lQDHNHrFH8D/5SMhzw2Z//p4L99+Nd59X+QVldMz?=
 =?us-ascii?Q?b7HZiCA4i4sC1hJYgbmMivvL1JiRS4G7wLcsI3yQYs4VTo7xRKq00j2+p42V?=
 =?us-ascii?Q?g+2jgs9JM8P3JnxDUZdnoxcyLW6ZwRZxLQJifIBwRDGAOxS0XLx5OybM+uYD?=
 =?us-ascii?Q?MBrP9toDyFHoVeDS9W9hnKmdW2fiFxM1OZ9tKXCzBPyEaE+VDX3ukLLiY81a?=
 =?us-ascii?Q?0sPwOi73KMwxQZpytj+8b7As5P6YLJZKR/0EqTr8CiqkgwXi5GaH8kWJG8nc?=
 =?us-ascii?Q?4SmQE2/LsnsoStpUkImzbv253WRFi9bthO02S9+sDJd4bA55ylmnmvSA07d3?=
 =?us-ascii?Q?UonWEQeFLTL5aKcs7VbGvCZ4mYp4rM24syOJnmiaP6x/V4IY/y+iKUhBnEyl?=
 =?us-ascii?Q?vOy6p5u9evua70JnpkMo/i/IEwgCy9GSizhmeOkxwB47SXikjOc+QmZgR6QN?=
 =?us-ascii?Q?5139+xBmzrCXUJZ1Gtu8QLva9okIC44Gp4QlYrqHgO9wyoq96Qab+l4nF+Xk?=
 =?us-ascii?Q?+KwLsCbagRfemsRp1Lbv3mPUSTzeYPSVBOlIpAcoRNi/ensWcDB6Z4zqrnst?=
 =?us-ascii?Q?Iza+ZVCIaMbUxBO41pc2YpaTwJFqRF1PNjXXdeA6sDOb03MSdk07KI7n8DEX?=
 =?us-ascii?Q?P+B1wwdnV2jyIm+5jsC2vknK0U3SgebXNZQw3eKV3hrzEBk3EmY6Yr5+gk3r?=
 =?us-ascii?Q?8P5rYXYK1FeFv5Baap4EX1iOhW/V2zABFxgWM1ttd8uSHUvBRvgbGpKPo6uw?=
 =?us-ascii?Q?MOnVAvLi7YfCA+pMeMQtXK3ealaYuRBHuyHdkl9UulLZwoXB3QWPIoFx5GCg?=
 =?us-ascii?Q?yhjN8YdZAL7H5QbsTE42C9pg1r+fNnfuRrg9xw7WOBBoJYK97mqJoPjQ6zvf?=
 =?us-ascii?Q?MiclwRR/i++LWKtxr2aY4EVcqk2/crgKzCvvrgpPTR1urFMM381xBiQodDyZ?=
 =?us-ascii?Q?uaJikFbGO+9wP+9AMqeSeAKkAfyazc84H8eA2PPp7tShEyfFtAoBIUgiWF+0?=
 =?us-ascii?Q?JGreyHz6efznAhWoXXjUY3SBiibUioHMjcKhjd06jgT9SZnhSVUxmAaMbGQx?=
 =?us-ascii?Q?HTzQWMwu67eDJ7+eHEQpe1ZG1sTlEPq44TaJlHsVkxmPy/KRksaGbsMgQ0jD?=
 =?us-ascii?Q?6DcO/7VTdt3kBKKqi+ChCOdvpZrt9/hA3Iy0iUf1KeTmEdiE89Q62JyJ3+vh?=
 =?us-ascii?Q?FOEgYoMjIBoW8f+mjsKoJWmbdEUPZGCtGiYikq7I/fkEe9BfsfmmDNEIvkaW?=
 =?us-ascii?Q?mB7ELUQEys4ol7FdOAfdGsTFgqKOYsxna9yJ4XT+MUGkloA1ZW8EXjQ6ixDl?=
 =?us-ascii?Q?xtpDiiHidi5wn+8VLhRn4avqShPLAIJT9VE50XAomiwjKVOSoNM+84Gw82vu?=
 =?us-ascii?Q?vluni/x/uVrTP40Q1y5MyJ61tY1hWehCrCl/QtxGM2F5pMKfzqozcpJid7gs?=
 =?us-ascii?Q?NQ9cj44PpwwgMZ36WkJMyTx88mVqJ2v7p+NwZs3Bmk0HNYOUXLgF9corkjOt?=
 =?us-ascii?Q?9WNxqQzlPRFlqN43vh6Yh2MOT2v10dRHSfqQscMSk6rE1QC+KajEh1Mqt2h/?=
 =?us-ascii?Q?bCsJBQ/zOH83dmpPnRR7nfYo9t7E0vpt0Ottj1ZYNYnvNbgf4Bo1hHQKOUmg?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/o2CpasHkSHRkxtROvchLxSaNNlMnpP71gG0fNjqMKT5haXmeNSfP+ngrp3Ge/nRObDzlEs3pqGtZgfeXQukTL4IqhR4AV0ur/QWIMTfPrPOjJVca6FNfWL6BW/8KBFJm2lIyF/PLEoAVU/4AKWv3ahHJDYmhoGBvm1JGvV4JjIYORDJYVxORO8VPpCARCYBdf7BflcBy5Y4asLmcz8yh+yBDmIA5Yzx8EScQDeiiYzqsElxF2dvrHD99rWeF3E9t9tP9mR0W4GEtjW0GXj34io/yYDrMqOiH/Ek2ktECjw1LDit79LpitArbXXazedN6yFl4iKSxZ011E9Ifa2C8QqfbwmGZdTqf/4hjDcaS2M8uBTWMsj7bA0Z8+c3weTYVm5AVZ4V5rbNbI4TSpUfxmco1E1OmLpB59ocMO6lWQ9ZLiJ7ARh8iR8DEKMSqAGmIfocFGY8Itk6X1VE0hflIy/50NDLKPCqVSrYjTTDUqNw246pkhHOR2c4if5J6aYHm/cUruKgfT+yobWxgHEj4boNBDKwfZrYdk8Y2ftGFviLoiZHQS5Fp8RVhtCuMv4oSKH0EUFXu2q3EWS3/Uvfatz3gTXs8UT9Q7VEtSifHy0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ea5c7a-09d6-49a3-e4c2-08ddd5e285db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 18:45:04.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEnfVQoQFO4SYqifuBuYHVbjRLlVmdLFpFhobUfpjXxZ6NGPnt9M3bm4KY8Vu5B7/sr6WM2J4qE0gIs/LIzdUJOCLQyXbDcWRKWk8V3jq+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4928
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508070153
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=6894f434 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=cVoj5qxHxIhgivUZPy0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: UKKjQEHhkkcFv6RCJTFIr51hlQoh5dmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDE1MyBTYWx0ZWRfX4ZDHHFN2/UWy
 GaNEdbsn9yP0S7vnjKqmCIeaPOC+aRodo7PizDtj11+YrPQf8rhrVHF6WwAF26TeA3ZxrDxGPPU
 nmIYLEptJNTikdjZodxB4Ivwd2jHprmEca2oJzhAJ86xrVe3qiu06F+JJ8qyg7IU7FxiRmIBg3k
 ZoZCbGWCZB2R6+fBo4FfDHGd+RivD8NLA0h2hqgWaLoa6zs3O4dh/2stcEy+3AhT2AJ17xCCnhp
 DNgYb24mBibImCdyguwhOwWPhRXungFymzt8NNYaXUxsDkTAZLF8hsJr/phxjrTSySUeRtrPX+c
 PROrWizXUWB5u+QZRaoWU5x087PyexaD01l64y/HSoESsS1ZfV2RvhZxdTiBa01yo/anPs/0zhC
 O3gsj18iyNZTZlMFAzMKZsy31oqH21jZhUJi3rf7QgvItuWUeXQwwGg+Xawb7tDtS7l+aApP
X-Proofpoint-GUID: UKKjQEHhkkcFv6RCJTFIr51hlQoh5dmL

Actually, I think it might be better to add a DTRACE_A_VALID flag, add a
dt_aggregate_clear_flag() function, and instead of using haveagg, set that
flag wherever you current set haveagg to 1, and clear the flag whenever you
set haveagg to 0.  (The dt_aggregate_clear_flag() is only really needed in
dt_consume.c because you cannot access dtp->dt_aggregate->dtat_flags from
there.

That avoids haveagg, and also stores the validity of the agg data in the
dtp->dt_aggregate member, where it belongs.

On Wed, Aug 06, 2025 at 11:27:58PM -0400, Kris Van Hees wrote:
> I am testing this a bit and seeing if we can centralize the call to
> dtrace_aggregate_snap() a bit more (unlikely), but I would be inclined
> to suggest to keep the aggrate code and only do the on-demand call to
> dtrace_aggregate_snap() portion of this patch.  I could see some use
> for using aggrate to rate-limit retrieving aggregate snapshots in
> cases where the probe firing frequency is sufficiently high to make
> aggregate retrieval a noticable cost, and where therefore limiting it
> can be useful.  Of course, that would generally mean that the script
> is poorly written and should be fixed to get the desired results.
> 
> But it has the added benefit of not introducing a new global variable
> whole not getting rid of (a now obsolete) one.  Since aggrate is by
> default 0, keeping that code (for now) is safe and will still result
> in the default behaviour being 100% on-demand.
> 
> On Tue, May 27, 2025 at 01:43:13AM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Currently, dtrace periodically calls dtrace_work(), which in turn calls
> > dtrace_consume(), which among other things calls dtrace_aggregate_snap().
> > But aggregations are kept in entirety in the kernel's BPF maps.  There
> > is no need to snapshot the aggregations into user space unless we're
> > actually going to do something with aggregations.
> > 
> > Snapshot aggregations just in time -- that is, if there is a clear(),
> > trunc(), or printa() or if aggregations are to be printed at the end
> > of a dtrace session.
> > 
> > Skip the aggrate-slow test.  Just-in-time snapshots mean the semantics
> > of aggrate have changed.  A fast aggrate means nothing.  A slow aggrate
> > means we are supposed to use stale aggregation data, which would be
> > baffling.  A future patch is advised to deprecate aggrate entirely.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_aggregate.c                 | 7 +++++++
> >  libdtrace/dt_consume.c                   | 9 +++++++--
> >  libdtrace/dt_impl.h                      | 1 +
> >  test/unittest/options/tst.aggrate-slow.d | 1 +
> >  4 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> > index 40c1ae44f..6c1b642ff 100644
> > --- a/libdtrace/dt_aggregate.c
> > +++ b/libdtrace/dt_aggregate.c
> > @@ -817,6 +817,10 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
> >  			dtp->dt_lastagg = now;
> >  	}
> >  
> > +	if (dtp->dt_haveagg)
> > +		return DTRACE_WORKSTATUS_OKAY;
> > +	dtp->dt_haveagg = 1;
> > +
> >  	dtrace_aggregate_clear(dtp);
> >  
> >  	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
> > @@ -1901,6 +1905,9 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
> >  {
> >  	dtrace_print_aggdata_t pd;
> >  
> > +	dtp->dt_haveagg = 0;
> > +	dtrace_aggregate_snap(dtp);
> > +
> >  	if (dtp->dt_maxaggdsize == 0)
> >  		return 0;
> >  
> > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index 8f50ebefc..a91413672 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -2353,11 +2353,15 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> >  				i++;
> >  				continue;
> >  			case DT_ACT_CLEAR:
> > +				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> > +					return DTRACE_WORKSTATUS_ERROR;
> >  				if (dt_clear(dtp, data, rec) != 0)
> >  					return DTRACE_WORKSTATUS_ERROR;
> >  
> >  				continue;
> >  			case DT_ACT_TRUNC:
> > +				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> > +					return DTRACE_WORKSTATUS_ERROR;
> >  				if (i == epd->dtdd_nrecs - 1)
> >  					return dt_set_errno(dtp, EDT_BADTRUNC);
> >  
> > @@ -2519,6 +2523,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> >  			func = dtrace_fprintf;
> >  			break;
> >  		case DTRACEACT_PRINTA:
> > +			if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> > +				return DTRACE_WORKSTATUS_ERROR;
> >  			if (rec->dtrd_format != NULL)
> >  				func = dtrace_fprinta;
> >  			else
> > @@ -3113,8 +3119,7 @@ dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
> >  		}
> >  	}
> >  
> > -	if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> > -		return DTRACE_WORKSTATUS_ERROR;
> > +	dtp->dt_haveagg = 0;
> >  
> >  	/*
> >  	 * If dtp->dt_beganon is not -1, we did not process the BEGIN probe
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 1033154d9..2c376f59a 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -405,6 +405,7 @@ struct dtrace_hdl {
> >  	dt_percpu_drops_t *dt_drops; /* per-CPU drop counters cache */
> >  	uint64_t dt_specdrops;	/* consumer-side spec drops counter */
> >  	int dt_statusgen;	/* current status generation */
> > +	int dt_haveagg;		/* FIXME: figure out a good name for this */
> >  	hrtime_t dt_laststatus;	/* last status */
> >  	hrtime_t dt_lastswitch;	/* last switch of buffer data */
> >  	hrtime_t dt_lastagg;	/* last snapshot of aggregation data */
> > diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
> > index e2a0f2cb2..cd91c0a6c 100644
> > --- a/test/unittest/options/tst.aggrate-slow.d
> > +++ b/test/unittest/options/tst.aggrate-slow.d
> > @@ -9,6 +9,7 @@
> >   * When the aggrate is slower than the switchrate and the pace of printa()
> >   * actions, multiple printa() should all reflect the same stale count.
> >   */
> > +/* @@skip: aggrate makes no sense */
> >  /* @@trigger: periodic_output */
> >  /* @@nosort */
> >  
> > -- 
> > 2.43.5
> > 
