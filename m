Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DBDDD2
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759806641; cv=fail; b=oVmnn3UIVnsi+5LfWEJpao9DFpIMMUQI40OW1dmOiOL61NFln+N9pIeaUg6m/2zIJSk+jTEfnFgDQwHN4uz/HncCLDVIScpP4A6d5ne8qEg/AwL1czc7lZFdAfm3EfSN2gae7RWVi2c0ge2jvVXls3okzYeSIfjoFcTl3Gdtxi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759806641; c=relaxed/simple;
	bh=8Ln11elIkKaacM32GyDSKLBAstsxXE7304II3FkzMx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lxPGQAVq4RIDHlwaaq1MfIp6sdbh8weOGq8nXljy1Yfo+1DK2jsLzN8nxficGIhDi3u2JdzwDpzM8OQZstlc2Auzq6fWZKuxblfwtgkegfjYgyzUVikeq/ehXzAYTV7YVZZ8v6CBfNGnOxP3osDXx59Ms0J8CaBMIDzgkeR2css=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NP+tI3us; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aMr2D/Ym reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NP+tI3us";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aMr2D/Ym"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5971Cin0008839
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 03:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5VfLon+MoIo2Oiz7IQn3yDXaRJVge6kjNGnwmCgFacI=; b=
	NP+tI3ustl+lGo2n51fb6o0tafN2bQQgdOvALdbJO6/M2TLDYZ6ppBx85U+Fsve/
	lm23zsIZ9gcPdbD+FpqG+fMxGk+rmpG8Xuu8S2KBTcJgSlRHNNPFY4q5ZqBpwSl0
	HeIxcfhNlrf2nmw5hs6q9GzhY5sSIZP/GjcCSes4PnmekEbXNc2/5FJxqKdEG6u9
	Aqs39BUQnKjjUU6kJU5zySeyBf+VQwS+RnZLqtP0mF47PWExyLASYgARCSiOf/s2
	nSuO7vUYP/uvoyoLxT+cngyEVHhfwjSIcXXnSWmBP94Pk1K6c1Hf3sRbox+Xo/gS
	jLFyz8ysiDM3uT8gMMfqtQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mq6mg7cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 03:10:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5973AH72021368
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 03:10:36 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012024.outbound.protection.outlook.com [40.93.195.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17v2hn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 03:10:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyBRYWuA9/SOfFfICEDlms0S35ws/KP5CDbCA/je/QTVh1qP8jYeijbHLzSlhG0B2y2sn6Emx4XwLTN7J1lQ52CAQDfSLTNxvS2tngWBwN5vP+U4fre+/sa7ocvfwU+m/iaaTvXRG8FifaLMPc/tvOsABihV73tkQf3WvDRB2pYctsUqJwSgwPD46QbsYKOP81DfcN7D7AchkCzt6981C3CHAOAC+ksrOyFPc3UbX9Hxn1T3JIpm6HQ2zEgdLawNd79rtjUqHw5aNkkAbFSKpj3QLIWWJ0FVwIGnevXGleZCibcziY+Tw2kMXfwT8G/qhP1v6VlJZ2G5v9dKkIq/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooWx0b719xufyTOsjDiKZ4ZwHQ3Xb676DHVJK+mzC8A=;
 b=W2uP9VcATnLeLhrK3zOCJSzEpPHarWx4qlYPslh0SM0YMFAmeGuUhwRCW95vAB2CxJScoFudB4QELCJYjgPKRtZdVmbpL3bs7L4p+Tlb+p/giFLuvWcXMr1e79wdYBsXDYr9BDnbrmTxaTHxMC8ddTgSJRWz8zUyjFHKUUVP7dLGwr1IRUKPvyZaOxbTLMMpjiydINtVZuKF+k2ztB9wvnXFy1gC3M4w8dcgR28/iI+uosmkr34tjV1N/mBV+u/nyofyFUUW0TKTfmjSrd9ObVGqPuN5vlwduPTWTG1fT/h4ggnCrPyy/PE5y23iym/m/whGwklrzM68TasOaKd9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooWx0b719xufyTOsjDiKZ4ZwHQ3Xb676DHVJK+mzC8A=;
 b=aMr2D/Ymtd4aDEBi2SpqdffFRXm66RCZJ6THLlPJk2cXNrCc+2CZJLxm3YqqNHhfBSf2237Nq5FPpUOVacGCyYylPKKAKDIbRn+wBjcRKTtp0xdcGKwx4INWHHVMSfqyAr8hfbdqerbUAb3CZzz6te2XqseUFTgqCRVhHsZGadc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM6PR10MB4218.namprd10.prod.outlook.com (2603:10b6:5:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 03:10:29 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 03:10:27 +0000
Date: Mon, 6 Oct 2025 23:10:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3] cg, printf: allow storing [u]stack() into vars and
 printf using %k
Message-ID: <aOSEoKnaf7uPKZOS@oracle.com>
References: <SJ0PR10MB567299E6DEDC0CBB101841DCC2E3A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <49de3429-e44b-a0a6-8370-76596b165934@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49de3429-e44b-a0a6-8370-76596b165934@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM6PR10MB4218:EE_
X-MS-Office365-Filtering-Correlation-Id: b08eeea5-40d5-45c2-955a-08de054f10b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ScGtb1t6MoE2lmg9mzxkArVjwLmKlGsKl8fEdO7BDhXep0B1cZYjLMqdqX?=
 =?iso-8859-1?Q?I3z2vPMs0oCuWw9z7XSgJqnUltYOOY1EHPb56uLDfjjIi/IfkRySlmN4bL?=
 =?iso-8859-1?Q?E7PEEfXMYowNtCdpoxCvydxl+h81fvYuIeK4vK+21SokodzqdcJjQx1gp1?=
 =?iso-8859-1?Q?xSa5I6/RhrKthbl/myz0z5gaPmbQlIQGq+RU3a5DeX3uRGGkB1Wl8Y9Vl3?=
 =?iso-8859-1?Q?VYSyEODzOfYJrwMkhZ4p4C4/9sfTERY5l0H4OS7uYGbnP4AU1T8tnyA3Cl?=
 =?iso-8859-1?Q?doS8rqOh14q4f4C2iyTs+zYY4pv561Pv+IhuP0pnJKv3fDkSeuA62EqnWs?=
 =?iso-8859-1?Q?F9DM9/c1fO7HR30i1KzB0gdcdkDF52LEORScbHN8XL55aZaZwi6wXqjZAk?=
 =?iso-8859-1?Q?tnUh3CnYfEbuhkdB72A/5wLtCk1PrC6yvXNKUDZh1XmdATPrwcT3+3UwhZ?=
 =?iso-8859-1?Q?GBPDec011OLinSi9PubKQrgGvItBq/pM/Z5b4R3l5+A2bLVNOiSSoBHEjv?=
 =?iso-8859-1?Q?zIG8WlXTzKOrkgez53wFivr9IA/OW7rS48FqqGphTVJxJh47ZXgOfppyJV?=
 =?iso-8859-1?Q?HuHhBconzlln789l6Kor4pZisBd+kO7zpwpcK6z4FN8L9fJcNJrXFLsl0B?=
 =?iso-8859-1?Q?YMv85dudnzRd1P63VsxgFMmXig/iHCFA+fE6ZrdAAK4QZJm7tZZgaWczGj?=
 =?iso-8859-1?Q?/i/ls5ol/rHPcAuUvMUBjoq35lF9dnB5++xVNTfRpkRZUhF3Jb+xyENKHB?=
 =?iso-8859-1?Q?9b7crfxxIQ9CC7ggM2A0y9ZBC5OMZUGpyBLScgRCx6xISrds27w7NG/tB0?=
 =?iso-8859-1?Q?IQhqRXUWOjjKFsSuWpDcom6xB77HKvvfpPuL9BXt6/2ylIwuIFLdJ6p6dy?=
 =?iso-8859-1?Q?J/g2p2glZFGD9aO6RP4gevzPj7mM3vXG403fcJRpDXadcVK4/WTP1lt6EW?=
 =?iso-8859-1?Q?uenOmlTy3zyMwCNxb5dLy2rS5RkyFeM7TWg2Rvn9ipiwvNjp6012F5kFq6?=
 =?iso-8859-1?Q?XP/wABxBer1D8RWzQG0AUnpZvCHaF79B1XxZUcIuSg6uXCO7RYEELnil1k?=
 =?iso-8859-1?Q?LjwfUKwwza+heqDBjCsJdYRHV4WyhSrHh63ZYDkXE4cwKMQ3r1K64Bcsgn?=
 =?iso-8859-1?Q?IvLTZhvm2+J8r2DC/ize7CirWLzGHrPUbGSc5ec4Pa3ruLsfJelArw9alh?=
 =?iso-8859-1?Q?enizXHbDVmKqvvdgsCVmQmOR4z57TDXBV/tTdufGXh9hdNWlKjWvXtWP+V?=
 =?iso-8859-1?Q?JS1+TSjLgp5ZmeczQs7qfnPIIU4B08OVgAHrjBQ04VeklUHzrPnTEgW5JY?=
 =?iso-8859-1?Q?puVDRzE4rbgrazC+cq+6ZKCnBoTYGSfYpk1fPZyYheiN1veIjW85WYW0Q2?=
 =?iso-8859-1?Q?U5r+NM9wZuu/CM7IqJljyugkqQnGbAcugNjkGC46U46g519IwxebUel+Em?=
 =?iso-8859-1?Q?mFGIKdKuBWG9zN9EpsbD3DyW+mVLd66qZTxcvOS0VjijdawDRKJKx5si6q?=
 =?iso-8859-1?Q?rNHEo0A+kOYpvcLsKEdQL/X4PAgIH4VkiVLUraQgcpDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ihOHFaXEJDe8QQzazWx0bttwn0gFdwvPy8+tCYL92opfER624JzW3QKUUv?=
 =?iso-8859-1?Q?zxzOFxjbdxjefDuCwrPew1rHMh9q4UDCYix1oknI5cKNG2gzgDveUZssp0?=
 =?iso-8859-1?Q?j5rjeWpAHp0WtOJKlg5fIiuAMH2z5IsnByHHQSP1/qfARAzF9hCPB/IZwu?=
 =?iso-8859-1?Q?HkCOC7HRJXO+VZqJwvSn/CMav9SBxPO0pEvaXkK0izBvuSZpF9mc+Oaqa4?=
 =?iso-8859-1?Q?kkSJsu/R85rDcwLGXVzjJyDZd/hC+GMdntMDqdf3aOTSB1CbBeIZC5613a?=
 =?iso-8859-1?Q?jPZuMi4bLpU0z9+fEe7XzRbRC8/UTwv0xGBBa3oXgAMzkviPJ6ElO8VZ7K?=
 =?iso-8859-1?Q?cXygIqSO9fBpPjEpiUr4FSISCxDZNX9MJFCROGxSvwi6YZPX40NXhae85+?=
 =?iso-8859-1?Q?DE+skYUTp7aGQ3gq3b8AhIBCodQdlyw8V4qlOxzhggDtp9Ow1ttq0urtGk?=
 =?iso-8859-1?Q?isomDNDsmN3ysybUgi5vHTShoqCssFcwIWN2KdyHUxg4PuxxehG7q0ep4o?=
 =?iso-8859-1?Q?vlUAUzv5l0QCMGqSlawi/03E7PCRH9rO4JepWG70CHTHVdsTMjhOmoHdO+?=
 =?iso-8859-1?Q?/pbZct+7Y/gmExw+feuJ4a+qpawkz913ve9uz4iT3UQEzbgdxblj0AusTl?=
 =?iso-8859-1?Q?so5g0Ht6umtCyFFcc1hgN2n7T/5bblJAPUknQKwTIAtbEuQ5UsxkHkeyo3?=
 =?iso-8859-1?Q?q646WV5j2nizHyKfUo7YSt5uoKv4QLF+LZAxHL3HUluCQgIp6HeX5xl1Wm?=
 =?iso-8859-1?Q?mcCH6XC3NxafydmhmAE0/TQj6Oq6k95KuyyKUiiNMAltGpfAiYetXYy6LX?=
 =?iso-8859-1?Q?iCrJsd6lCLEtqglW/jUuq+Lkh89FKkHlZICIeJX4QXovs772oGJlUlnXHU?=
 =?iso-8859-1?Q?883sNtcBge/EZqtWBs9XOc1tPhJo8NsILE0S6c9VimubCKuEqw24baD3ID?=
 =?iso-8859-1?Q?sNm0qybGvrD+pV3F5bkKzbC807AD5Jz6A8wSC8Eukbl6nyDeRmfXpXDF8t?=
 =?iso-8859-1?Q?UvOwjpw2YsDaEzlAAGUKd4m2HkO0Or7vG66LEbjCCA1p14siGx29hHWBXB?=
 =?iso-8859-1?Q?4s026yqESpZDloyTiL+ixMcBM1P888xmlgubOi/vOJu7nbs8HXPhmilgpu?=
 =?iso-8859-1?Q?gjyw7VQmlpPevnGKrs5poMxa+SJUa01t91j31BPkeenMNuVl0kdpsvbx+n?=
 =?iso-8859-1?Q?vPScAwXEbiMSCWY7wUmcuGxLdBUzCqgMksKCFfu52dBhrjM9PCGQJyBviq?=
 =?iso-8859-1?Q?k9NeLCTahgj6OVLEYoZO/iPT3WgAlHYM2mzv57ANyIiXjKPsWUYKyAIArw?=
 =?iso-8859-1?Q?zAHfQjUGsWKXh0S0DAvW283bCVCDssplLA5ZuL0rx1LvmdZFnj+C7pbAbm?=
 =?iso-8859-1?Q?Gwm62Yz6VMfl57F4kO05ZtKRtQpHxS9StE6NfKuK2+B6OnMy3C3SOkC++i?=
 =?iso-8859-1?Q?YvcRxCCL7ILCEQFjGhJEniHcvlzJA3lgN56kjfCSoeM5iyU/uUz1GWnPlr?=
 =?iso-8859-1?Q?4k0IK8tmKEt8EBjyQRf+6IzwOtISimIfQKCM/sE6h90pD55HaWQiPmyzGe?=
 =?iso-8859-1?Q?WCwmN8tFBEGcqVRoBuEVW4uFKAAqKPDp8elv3ur8xY/m6Pia6vRdbVbW3/?=
 =?iso-8859-1?Q?HoWyA8gASL9RYuKYPx4VhQ/ncijhBo/2UhMUxONL7Wn8clUgbWK8QyUw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	btdEPPa7eMaWSidinczlA99WXg2z00CeqRy99+eafyJYcEtnh9BJ1Q7ljZJxURg/kojf7JUZo2EfUDKwtYxobnVplnnHOaep+5G5Dy1AW8XjB1L3BlcQ1CQeGnLHQZlj2NkWc8P/BGlx10B2l3LHnb6dkvMbqnHLliKm12nahphp/gbbjY+YX7MWeNXC1GumTh+jaU0KXMfTTANYO5jxVC8IM0nRXNPa6+pPxcyzntQatOjEKn3COFsIh2Sc8XyFtmoDDgGSPvcSVdh6wNrCP4lSwEiIHGx/+0KB6gaFgplTsUuY8QvkoGXr25lFIhtK1Lj3tD0gj8hqrTTyR6gmYsAMtbnZifE1vQM8eM0igNLxZkjra1obPVVEoJBMialNZTQDyKipsAt+kgtUTL1DsrFlIWTg2zzW1p5jN1etd+Q/cXoGIAMda7IJ+8l8OQqGmarCXRsrYXnHQRGmoiiMI0IqmGv2ZKecSFA6YhrjGyEPfH+8kH2fOD6iT6WLnvVrc4TzltHLGLNtvs9yBZTk0g0Cqzug0oSLkbhdQVPZ0Gd9rL5qWCb9hVtd9Aw1h7RBK6zStT4oWiTJiE3H/4BF8dqmpFa1H3+WxzLJmc7DCuM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08eeea5-40d5-45c2-955a-08de054f10b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 03:10:27.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVvmAMJczZDKDStA+cuCVy/NJaEkaBaoNDxJZtJAz42Hml5LHryuhCy1G28hlvC3w1Rfu+L4sqXpK1q6nbueyJ9ou8Pq0ZU6vthBZYl69mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070024
X-Proofpoint-GUID: EHOgBw8Bh5lQmmxVHGR71QhoiQYB9UCk
X-Proofpoint-ORIG-GUID: EHOgBw8Bh5lQmmxVHGR71QhoiQYB9UCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE4MyBTYWx0ZWRfX5/DDUaP7SeIo
 fW1PUFrKQbk109QeXq5MWHQFkrOx9luI+eq1SeSyMV587oEUDCAdwJIf7m0kInJCCw+slCLAbdG
 kdLsV+ocXo6z/aRv2dZsEbIp0BFAxBMxcszS3ldsi8AV5phROi5qGkBpVYXOpB6gYqIihxdm4YO
 Lio/j8VbP9vkDkBFV3kxfGxzEkJYSgd+CMVmCiZqfo63W07ERoglrem9QKs+4JYd8oOwi/Y5TPe
 z6U1XQIRV+sQsyTlwlSChB7N8Emmu0K0FebYZkFV8tc9NIvWrN4Nn3tiIbMhKbJJzX2V8eo+jWq
 3jIuK2A2XCW6sLeHj2GVduNL2SbDykqOYJMwu0sW+RrfTIqkyjwa29PpJGLjtNy7fU8ZTgrX+Uo
 2yAx+tAYRkUpBQDGfu+p7ySQpHGYYQ==
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=68e484ad b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=flbvYbUGJUJWfbkAXt8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Mon, Oct 06, 2025 at 11:05:26PM -0400, Eugene Loh wrote:
> On 10/6/25 15:55, Kris Van Hees wrote:
> 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > @@ -2647,11 +2647,16 @@ dt_cg_act_speculate(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >   	dt_regset_free(drp, dnp->dn_reg);
> >   }
> > -static uint64_t
> > -dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
> > +/*
> > + * Extract [u]stack() argument data, storing number of frames and optional
> > + * string data in 'nframes' and 'strsz', and returning the storage size for
> 
> Or, in '*nframesp' and '*strszp'.

Fixed.

> > + * the call stack data (not including the size of the optional string data).
> > + */
> > +static uint_t
> 
> Again, I would think that "size" should become uint  in dt_cg_agg() as well.

I believe I amswered that in my previous email already.

> > +dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind,
> > +		uint_t *nframesp, uint_t *strszp)
> >   {
> > -	int		nframes;
> > -	int		strsize = 0;
> > +	uint_t		nframes;
> >   	dt_node_t	*arg0 = dnp->dn_args;
> >   	dt_node_t	*arg1 = arg0 != NULL ? arg0->dn_list : NULL;
> >   	int		indopt, def, inderr;
> > @@ -2760,17 +2772,18 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
> >   		dt_regset_free_args(drp);
> >   		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
> >   		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
> 
> The unnecessary MOV32 instruction is okay, but I'm curious what your
> thoughts are...  why you're in favor of keeping it.

Oops, as I mentioned in my email, I meant to drop that.  Fixed.

> > -		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
> > +		emit(dlp,  BPF_STORE(BPF_W, reg, aloff + 12, BPF_REG_0));
> >   		dt_regset_free(drp, BPF_REG_0);
> > -	}
> > +	} else
> > +		emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));
> >   	/* Call bpf_get_stack(ctx, buf, size, flags). */
> >   	if (dt_regset_xalloc_args(drp) == -1)
> >   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
> >   	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
> > -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
> > -	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> > +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, aloff + 16));
> > +	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, nframes * sizeof(uint64_t)));
> >   	if (kind == DTRACEACT_USTACK)
> >   		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
> >   	else {
> > diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> > @@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> >   	return err;
> >   }
> > -/*ARGSUSED*/
> > +/*
> > + * The data at vaddr is structured as follows:
> > + *	uint32_t	depth
> > + *	uint32_t	strsz
> > + *	uint32_t	is_user
> > + *	uint32_t	pid
> > + *	uint64_t	addrs[depth & 0x7fffffff]
> > + *
> > + * The 'depth' member provides the maximum number of addresses in the stack
> > + * trace.
> > + * The 'strsz' member provides the size of the optional string blob that is
> > + * appended to the stack trace data.
> > + * The 'is_user' member identifies the stack trace as kernel space (0) or
> > + * userspace (1).
> 
> Or, instead of "1" it's ">0"?

Fixed.

> > + * The 'pid' member provides the userspace process id for userspace stack
> > + * traces and otherwise will be 0.
> > + * The 'addrs' array provides the stack traces addresses.  If the stack trace
> > + * is shorter than 'depth', remaining addresses will be 0 and can be ignored.
> > + */
> >   static int
> >   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> >   	      const dt_pfargd_t *pfd, const void *vaddr, size_t size,
> >   	      uint64_t normal, uint64_t sig)
> >   {
> >   	int width;
> > -	const dtrace_recdesc_t *rec = pfd->pfd_rec;
> > -	caddr_t addr = (caddr_t)vaddr;
> > -	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
> > +	uint32_t *vals = (uint32_t *)vaddr;
> > +	uint32_t depth = vals[0];
> > +	uint32_t strsz = vals[1];
> > +	uint32_t is_user = vals[2];
> > +	caddr_t addr = (caddr_t)(vals + (is_user ? 2 : 4));
> >   	int err = 0;
> > +	if (depth > dtp->dt_options[DTRACEOPT_MAXFRAMES])
> > +		return dt_set_errno(dtp, EDT_DSIZE);
> > +
> >   	if (depth == 0)
> >   		return 0;
> > diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> > new file mode 100755
> > index 00000000..9999094f
> > --- /dev/null
> > +++ b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> > @@ -0,0 +1,59 @@
> > +#!/usr/bin/gawk -f
> > +
> > +BEGIN {
> > +    cmd = "uname -rm";
> > +    cmd | getline;
> > +    close(cmd);
> > +
> > +    if (/x86_64/) {
> > +	gsub(/\./, " ");
> > +	maj = int($1);
> > +	min = int($2);
> > +	if (maj < 6 || (maj == 6 && min < 11))
> > +	    missing_frame = 1;
> > +    }
> > +}
> 
> Cool.  Nice solution to that problem.  Unfortunately, it fails for me on all
> ARM.  I think the problem is that the "missing frame" problem is on all
> ARM:  even newer kernels don't fix it (just on x86).  So, for arm,
> missing_frame should be 1.

Fixed.

> > +/myfunc_z/ {
> > +    # check probe
> > +    if ( $1 != "myfunc_z:entry" ) {
> > +        print "ERROR: expected fun:prb = myfunc_z:entry";
> > +        exit(0);
> > +    }
> > +
> > +    # check stack(3)
> > +    getline;
> > +    if (index($1, "`myfunc_z+0x") == 0 &&
> > +        match($1, "`myfunc_z$") == 0) {
> > +        print "ERROR: expected leaf frame to be myfunc_z";
> > +        exit(0);
> > +    }
> > +    getline;
> > +    if (NF == 0) {
> > +        print "ERROR: missing second frame";
> > +        exit(0);
> > +    }
> > +    if (index($1, missing_frame ? "`myfunc_x+0x" : "`myfunc_y+0x") == 0 &&
> > +        match($1, missing_frame ? "`myfunc_x$" : "`myfunc_y$") == 0) {
> > +        printf("ERROR: expected leaf frame to be %s\n", missing_frame ? "myfunc_x" : "myfunc_y");
> > +        exit(0);
> > +    }
> > +    getline;
> > +    if (NF == 0) {
> > +        print "ERROR: missing third frame";
> > +        exit(0);
> > +    }
> > +    if (index($1, missing_frame ? "`myfunc_w+0x" : "`myfunc_x+0x") == 0 &&
> > +        match($1, missing_frame ? "`myfunc_w$" : "`myfunc_x$") == 0) {
> > +        printf("ERROR: expected leaf frame to be %s\n", missing_frame ? "myfunc_w" : "myfunc_x");
> > +        exit(0);
> > +    }
> > +    getline;
> > +    if (NF > 0) {
> > +        print "ERROR: expected stack(3) to have only three frames";
> > +        exit(0);
> > +    }
> > +
> > +    print "success";
> > +    exit(0);
> > +}
> > diff --git a/test/unittest/funcs/ustack/tst.store.d b/test/unittest/funcs/ustack/tst.store.d
> 
> Okay.  Just curious again, though.  Is the omission of .r and .r.p files for
> this test intentional, given that the stack version of this test does more
> checking.

Oops, forgot to 'git add'.

> > new file mode 100644
> > index 00000000..6a9f7c94
> > --- /dev/null
> > +++ b/test/unittest/funcs/ustack/tst.store.d
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: It is possible to store to members of dt_stack_t.
> > + */
> > +
> > +/* @@trigger: ustack-tst-basic */
> > +
> > +pid$target:a.out:myfunc_z:entry
> > +{
> > +	v = ustack(5);
> > +	v.depth = 2;
> > +	printf("%k", v);
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/printf/tst.stack.d b/test/unittest/printf/tst.stack.d
> 
> Looks fine.  Other stack tests seem to be migrating to hrtimer_nanosleep --
> and dumping the destructive BEGIN{system()} stuff -- but that does not seem
> necessary here.
> 
> > new file mode 100644
> > index 00000000..db943c29
> > --- /dev/null
> > +++ b/test/unittest/printf/tst.stack.d
> > @@ -0,0 +1,33 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: Test printf with %k and a stack argument.
> > + *
> > + * SECTION: Output Formatting/printf()
> > + */
> > +
> > +#pragma D option destructive
> > +
> > +BEGIN
> > +{
> > +	system("echo write something > /dev/null");
> > +}
> > +
> > +fbt::ksys_write:entry
> > +{
> > +	printf("%k", stack(1));
> > +	printf("%k", stack(2));
> > +	printf("%k", stack(3));
> > +	printf("%k", stack());
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/printf/tst.ustack25_pid.d b/test/unittest/printf/tst.ustack25_pid.d
> > new file mode 100644
> > index 00000000..9ae3a7b8
> > --- /dev/null
> > +++ b/test/unittest/printf/tst.ustack25_pid.d
> > @@ -0,0 +1,21 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/* @@trigger: ustack-tst-basic */
> > +
> > +#pragma D option quiet
> > +
> > +pid$target:a.out:myfunc_z:entry
> > +{
> > +	printf("%k", ustack(25));
> > +	exit(0);
> > +}
> > +
> > +ERROR
> > +{
> > +	exit(1);
> > +}
> > diff --git a/test/unittest/printf/tst.ustack25_pid.r b/test/unittest/printf/tst.ustack25_pid.r
> 
> I still don't get this one.  Just as in v1 and v2, I get consistent FAILs
> here.  Does this pass for you?  So far as I can tell, there are issues with
> leading whitespace.  How about trimming the leading whitespace in the .r
> file?  And...

Ah darn, got distracted and forgot to look at this.  Checking...

> > new file mode 100644
> > index 00000000..e7732fb8
> > --- /dev/null
> > +++ b/test/unittest/printf/tst.ustack25_pid.r
> > @@ -0,0 +1,28 @@
> > +
> > +              ustack-tst-basic`myfunc_z
> > +              ustack-tst-basic`myfunc_y+{ptr}
> > +              ustack-tst-basic`myfunc_x+{ptr}
> > +              ustack-tst-basic`myfunc_w+{ptr}
> > +              ustack-tst-basic`myfunc_v+{ptr}
> > +              ustack-tst-basic`myfunc_u+{ptr}
> > +              ustack-tst-basic`myfunc_t+{ptr}
> > +              ustack-tst-basic`myfunc_s+{ptr}
> > +              ustack-tst-basic`myfunc_r+{ptr}
> > +              ustack-tst-basic`myfunc_q+{ptr}
> > +              ustack-tst-basic`myfunc_p+{ptr}
> > +              ustack-tst-basic`myfunc_o+{ptr}
> > +              ustack-tst-basic`myfunc_n+{ptr}
> > +              ustack-tst-basic`myfunc_m+{ptr}
> > +              ustack-tst-basic`myfunc_l+{ptr}
> > +              ustack-tst-basic`myfunc_k+{ptr}
> > +              ustack-tst-basic`myfunc_j+{ptr}
> > +              ustack-tst-basic`myfunc_i+{ptr}
> > +              ustack-tst-basic`myfunc_h+{ptr}
> > +              ustack-tst-basic`myfunc_g+{ptr}
> > +              ustack-tst-basic`myfunc_f+{ptr}
> > +              ustack-tst-basic`myfunc_e+{ptr}
> > +              ustack-tst-basic`myfunc_d+{ptr}
> > +              ustack-tst-basic`myfunc_c+{ptr}
> > +              ustack-tst-basic`myfunc_b+{ptr}
> > +              ustack-tst-basic`myfunc_a+{ptr}
> > +
> > diff --git a/test/unittest/printf/tst.ustack25_pid.r.p b/test/unittest/printf/tst.ustack25_pid.r.p
> > new file mode 100755
> > index 00000000..c0110e00
> > --- /dev/null
> > +++ b/test/unittest/printf/tst.ustack25_pid.r.p
> > @@ -0,0 +1,37 @@
> > +#!/bin/bash
> > +
> > +# A pid entry probe places a uprobe on the first instruction of a function.
> > +# Unfortunately, this is so early in the function preamble that the function
> > +# frame pointer has not yet been established and the actual caller of the
> > +# traced function is missed.
> > +#
> > +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> > +# See commit cfa7f3d
> > +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> > +# for both a description of the problem and an explanation of the heuristics.
> > +#
> > +# Add post processing to these test results to allow for both cases:
> > +# caller frame is missing or not missing.
> > +
> > +missing_caller=1
> > +if [ $(uname -m) == "x86_64" ]; then
> > +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > +
> > +        if [ $MAJOR -ge 6 ]; then
> > +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> > +                        missing_caller=0
> > +                fi
> > +        fi
> > +fi
> > +
> > +if [ $missing_caller -eq 1 ]; then
> > +        # Add the missing caller function after the current function.
> > +        awk '{ print }
> > +             /myfunc_z/ { print "              ustack-tst-basic`myfunc_y+{ptr}" }'
> > +else
> > +        # The .r results file has an extra frame at the end in case
> > +        # the caller frame is missing and the 25-frame limit goes
> > +        # "too far."  If the caller is not missing, fake that extra frame.
> > +        awk '{ print }
> > +             /myfunc_b/ { print "              ustack-tst-basic`myfunc_a+{ptr}" }'
> 
> ... trimming the leading space in both of those print statements.
> 
> > +fi
