Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33C22EE5
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721327733; cv=fail; b=GQNZfoEzr0kJ00bDHLCC86en6vJMbgtVwhXnM6RvhB894xNAXJWfg3X0XR0Uemg6MSG2VbFc8WcW9VG84vxJXxNz5FgVmNQlb1rH5GJHGADTmMPgQz9axbMpAAc/qlVUtFn6EHyUxIb6vEP3JiHCVALhLHkvxD3Fbj39YlFsPnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721327733; c=relaxed/simple;
	bh=2d2vgFQWX8B8Q1xC3BZJN7iABWGYgutr2FhcQzRm6z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UC3ZWUt/RoyU6oIbR0c0g0r6QZJH25AZx0jPqoqdeOFev+WwWNZiRU0EcZTZr2r52MR8Z3wtPo90ujQy4O4PyQeVFXygFZSpe/Kqg+PIDHtydMKm+Zh3ydYuWPxFBB7F9AhtL0g886ya8eBemEkNWFHYMdTvhIh42tyvtHacMlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=llEiuG8a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ywt3yxNT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="llEiuG8a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ywt3yxNT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IIFvbG004363
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=PzCqEMgMzL/EzOe
	m+Bag+3n6MyObRBTesnAD+OCp4O8=; b=llEiuG8aRtdamdJTMS8W4g/G7N5Apa8
	hOJ79Uio+BsLC6tPsgUGfCs4mxQCKNokG9yc7vYAhAAe8meZdLYDluJinEH8n2eg
	RISjQrZq6Pmk+6kVxHnEKixpsohuoABAlmEWMEPkyo+W1bXurFlRZ/l+jA020qJp
	pF5uYPuDLYgch9nxZtk2bD4NS7q+OMbGj09kmWfta11MCKclo52Z9y3msXwEe7Kq
	bbdJ8U6vu8EUM491DZG34KCCiG9uyik+qWFDNyUUH5CAxyrLTsCJ7b1SxFsk/vPV
	usE0ewQWOSFfgLaXWcuon3MtS2Dqnxa0KDLnYMrExTivDB760oUJi4Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f85u81t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:35:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IHf78n020080
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:35:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0sm51-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:35:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln7yIB9IhZpjMs6n/XJ+WJuUWrFA9gNZPrJstoxHEyreLt4iVkO3nvfO+af1IYdSg+IEAeZHqD8K/byz/Gn89mI7BKZbXqyvA6+H1bBqrNwR3KjS/fJRaFeAfb9jfW0l3UEiqlIMw47mnqEGUwHjujrpzDwCQT5zx46fPyd855/0pVwnZQGX24nxsrMRwKIKAc0aobI48i2b9Xin3urAuBddvdFTkrrlITXg5y1EwPWPbgtn1ZcWZgi5bo5YzZ7z/H8HFL6lnDrEK0mMAgCw85iQssei0ubDDPxlhzkuRNKf1XEkNapnjmVz+PjEMUI/JlK+ck1TkoiG9mOAiq6R5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzCqEMgMzL/EzOem+Bag+3n6MyObRBTesnAD+OCp4O8=;
 b=S0xXw/RpEgcooeSywBe/U43sLfY84L+rZrSQ2+BJh2xSmCKFuSoP3j+xxMsA7WgucDU+28RK+5uMLw8Jru2bXlamCTatHZ0nZ+ijVMwmhmD8H/BgP9Eot67IQp353seuve1fuFgRBH2aql1aajkC3RKfbgxPFqIgn+Q5IWU7zdWRtc5IrqU3EchkH7a7pzELjJi3AWGlZd4GRBtTwlpUAN7t8egGLhfisJuYwprHNjLaNXOQaXdE++NrgX6h2xE8oku+GPHX/doQDUb2AxZFk0KXInShgX+cCm78WfTfoUeME7HydEZdxHy+CRBQm6wWcgdZpb/Viv/boTUlM5upGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzCqEMgMzL/EzOem+Bag+3n6MyObRBTesnAD+OCp4O8=;
 b=ywt3yxNTo9D9UFf1KgsNHI/8EPFOh3xEN9wKJVs12E3M3/+U+GfeambZJu17ADGKe4aRC3WBpQdVqiULQYdoaSQltdhy0F6BsJkt8HqLXZ/+n7LUYVny/22LEoCvmGMxzNEZiRdvzoR3ztyaM/Qk5fXYoll5PXett3VNMu5y92E=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA6PR10MB8181.namprd10.prod.outlook.com (2603:10b6:806:43b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 18:35:27 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 18:35:26 +0000
Date: Thu, 18 Jul 2024 14:35:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/38] Get rid of unneeded enabling_defines.h
Message-ID: <ZplgbF+BP3FK8PUn@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-6-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0652.namprd03.prod.outlook.com
 (2603:10b6:408:13b::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA6PR10MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 69996ca5-eda7-4c0a-f1d4-08dca75864a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bnT1bLenEm0LsdmsHbuRhVz3HJsx5I/o3dONs2gVuSUNuxT9zIn44HdOBLN3?=
 =?us-ascii?Q?burLdK9MfoHFVoA3WfPiTu9g3k5ngDODkjyqvM2rlDApE/GISN3hfbpcwli7?=
 =?us-ascii?Q?OZTmFWVU193sB7SuVGGVxD89vCO7tdDFvpG5VQZroxrjIOk7yF6GpXRxXfCk?=
 =?us-ascii?Q?maW2/X1rkevGkkpcnunJYJg/moGFHGfxKPTSSw8gmajrPeLWbCtSNO/Dtrm/?=
 =?us-ascii?Q?GbHdOaymQnnEqnTfItZuze7YMxZE7Q0Gofk/gR4Wjq9iwt2zPvZs4VSgwaxA?=
 =?us-ascii?Q?eCICUYAxsWt7UZNmjBS6cfzZHHQ17b/pDmADYhvIP0HRKtZukKGXXFHiXkDR?=
 =?us-ascii?Q?4ml3keEDzfuO3byTGE1HVtomrP7L3njUweI+RqLW97d2dt3conE0L9tSvME5?=
 =?us-ascii?Q?nePsAHgrzlZzxEJCZhaKPFMQpFhRo1bhHmOEflDvLdsXhUJr0j/LqL8XwpSO?=
 =?us-ascii?Q?UcA2Jwd/T6yNfMVSL5JovL2PsgNnIaUYhg6KEZX+RZ63OG1itv34YDjO5JQK?=
 =?us-ascii?Q?sPbHIa8ELAKf2NGEP11g1RsIw+wPmvbXHp0RG5IqwPjTUIl6hSdOBrcNsgxr?=
 =?us-ascii?Q?d2LXWRQ8MFEAz2LxZNLxUls+1SXmCJ41dQKFlU76O8dkOKWBfW9CSrZVIB9E?=
 =?us-ascii?Q?9DoqKbl+mQPRDitoCGt3wcPDgINhrPauhJf3EjCHkgwpHQ/xGXZR8sm3YWjm?=
 =?us-ascii?Q?YHG9QaHYKSlprWLIZ/5rdO07Zs0oY8GpI/wZCDvoGnf1AvYuTrP3TmIFFqBt?=
 =?us-ascii?Q?/+bdPGIA3r9r2flD1iwGsqvXRabmnvK9MpGGHOfUAT6XZkuSo6Rg9+sXh0IO?=
 =?us-ascii?Q?thjLdi2NSWWe8B3ktHsgnPaCnr6QqFqYRh7KeXgfDHsuUJ6k4ARnKr01Mzlf?=
 =?us-ascii?Q?58LFh9haNtWnBE58WzZ9GHU15tD3PgFlTqo2w3aYzFpc9tRTyAnTCU/l5vdq?=
 =?us-ascii?Q?zI4kVLnVimYCvae6uhv+/pg23277XU/zyZCi53pJeWToN3aOsv9wVdeGK5NW?=
 =?us-ascii?Q?2KCr3hpWA1IgG+QAayZwq9VEyaUBcVyikZ9cc5k62nMybV+63I397meufIt/?=
 =?us-ascii?Q?z3scXXRN/M5DOL9KFEF3Tmq3Jm8brpqB0r8eAS9pBVIbLw5ESOIUalf8XXvf?=
 =?us-ascii?Q?vg774BNIM3SEVvPzlyqnWKTi6q1aVPkZPR9fTkpBkET1dPIbMANkbA1opAcb?=
 =?us-ascii?Q?lYK1cHRXj1GdN9yTX0/siA81vTAKS7uNyacWY7OeuEGlBPTUSkeK1eeBlvJh?=
 =?us-ascii?Q?R0LWHeods0m5zzIFb80ooaycuuE32dJw0nbRSSADoaCGQRg2ilq/OgiBuCrc?=
 =?us-ascii?Q?GYIWaLrx8HPtaj6U/Awf4GUPe5gf0xujXJP/aybiCPYfSX2GVqm4yJJFC4ft?=
 =?us-ascii?Q?3leVaCQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/95tFm+nj/AEyNFLnuMmGkH8XKGXn0ihgvJ5alJyKGWQJeyEwvuIlDL10Yzz?=
 =?us-ascii?Q?KA0i3IdvpwUMuDcJjFNN0fpTDYCAjnvXVHMOcxvQVA0nTmutb0DdbBbBjWik?=
 =?us-ascii?Q?6d5RTzyHzWtNrJ8iKLJ01Tok/Ez3rmKpuRnHvlWdZgk/fgIrLFyDgAnlInT2?=
 =?us-ascii?Q?yv4zhkaixOoZoi8SG3tLs3J7gnyS0aSalJXQA//iOdiHpkUpF4h1vxJUggkw?=
 =?us-ascii?Q?EuPbyHzGBZH3MXSy/hHobtXwC2eM0deIhhFiKmRIHDgfj6kqKDwUgdI4qUbT?=
 =?us-ascii?Q?k2xHq5tKgVctVCi1iqZDE+sWlptS/Po/SS9FVPLE2pbYNeldtC/3vgvKTZ80?=
 =?us-ascii?Q?+C3Ak3qi0tHdXd9CQqDKaRZlP4XkRnhFthRco4DllK/s3rcfVCbasCANC5IW?=
 =?us-ascii?Q?iZ7c0TY9Qhp6DjoFu6AwYbkAZOoJ9+PHcyKwZvkCrNzKtpcd+BAIdPyGeL/U?=
 =?us-ascii?Q?dTePPTUzLrzk0ey7GN5V8olUMjHWwJquGQQVxxpWlB1HcRqrklJmc3+pUi3P?=
 =?us-ascii?Q?jkbSpWdk0eBon1mit+WGjvI0495V0JEjfmhpfmcEC9XU/GjtJZEUdHN+33wM?=
 =?us-ascii?Q?ONUuKE6t5EYvvYZRp52b8VYy8vq2U7MzsiB+oa+jNtuuii8h7P35/pf6bcsC?=
 =?us-ascii?Q?NbDDS0s0j+giJCOkVO1AGZ2C6OXExP01747AuDBhsvW/k/UuG1DLh56HB365?=
 =?us-ascii?Q?/LbSdx7W0Ie79yLCBBAUv5jiydtVtEBYjHPeNJ8/TIefE5PNe+yM8qjH6amF?=
 =?us-ascii?Q?OsnAl8b6m1aHTYXnyFNGeaQAJrhNlrw1BvfVnxJaRgFiygkG5A08+2gtRQls?=
 =?us-ascii?Q?ksZilm2fGzEIpoKSTm3HvZBT4iIFt1kouJyW60VcXSk1GhECsbEcQu4YpVoY?=
 =?us-ascii?Q?6vVjoRYhstmHN3Sxl5WbpiZmLjbXZa4JLjmAmoJH0Igwd0xlIUgbVw3J3BiJ?=
 =?us-ascii?Q?6pPdcRdPMRO+56PSTZHupMiemL+oZkf+kI3zTr22qX/ANTeVJXEx4ew5v8Hp?=
 =?us-ascii?Q?TwVrxwumbq1uxCzQgsMfAshpHA+qL9J5mss4AQ/b92FWPMgB7DqgtjrBF8Pj?=
 =?us-ascii?Q?i4c3LmIP61CRc4habhAKeXM1l9uBg1fVnDztOcCe/KphBM24Mx/o+xeenLPl?=
 =?us-ascii?Q?i88TUXe/up3zfTDT+lVgFaF2sDW+sR3ccA9/yBWqV8SC/TLb13wDiP+n8PL6?=
 =?us-ascii?Q?U9PjMoLzhjDa846X7J3FC5eMMXre2LhqzZZAhDFyDwxvR4CXx83fo6mTVZ/j?=
 =?us-ascii?Q?8NCeWRkc2ip0B9wSHAP3KQkK5Q/AdDwTADJAUCpLSkFfetqfXKAcevVCoXVs?=
 =?us-ascii?Q?quNHpNu5i9j0lovCld9aVRYibAsfF38aanZcwFL7/xPTzho1bBs9JEn5yd3m?=
 =?us-ascii?Q?TjtEwPoPSKZXsU4PGeSTkSku0/V4nEKyWSISPXaKz/dW5JAemFkP4nUNaC3N?=
 =?us-ascii?Q?JGZlsjsBCUBMHsaaFp+gc5jRCmsHcUQD563J8pEUNUYakkBoWwYhhTi0uouf?=
 =?us-ascii?Q?GyC3uRpD4tj2DZKN6iu9sXiXiWUMIturSCp6gZzSXSsgb1/fm3YdmWyrJAHM?=
 =?us-ascii?Q?b5nJQUofje5jMn9A/BczkV2GC3kZL0uztcRjXhboLXAfAzNpPXdIqKlGdyyl?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HSaJAKlqJrigdJFFzOhQDY5PZxzfArRaqHDg3WRiABZTyX0BUVSk+sAm+nlwxpqG0eqTHMD6kKp8G0A81WivO3e3UHrMMWgobH3YuhVmtSG0H/tvvB3BnhQ09gzpgCC3MeuTvR4UWv1CcUBDbkdh46Q61Rp8049ZAnUWjO38ibu3ZkPIHttyQF9E7el+3pKi9ytAQ0bxZzRXXLqM4JtasFD/zM4afACbpRLsoWLIJvlkPtKZgdJHETkDhHXUPgPKjyccvTHGqm0p0hG13hj0XZrY06xbUDsjpJvaVnOT/RglWBqwMr7RFjZtBK2+88Wi1YXqX0EUvb8fQSoewMBfGFKvZ6cEW7aMbnHB67tJtvStpWIoPhmb2R1wzHfAmhbwrnj2LdTPukcOBH9iGkQBuocc1jNvF9ai/9YsCTtqRGO0x0qya6K5b9AO8hB55eV3aiM2qcXgwHTz+gGxfIzbfhJXUjJGb9w+D4hrYFcQiZaEBeoBdck4nHbod7t8ufecdLOxk+WoDzS2VCemzeeiCEXBQBoxx20h0isS5RUnOnNbop/ah73yO0GKtsf5V9OzSAHeLDsXpwMFkHQSJK//SeFi48Ka3gJsChYsAAlTYTc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69996ca5-eda7-4c0a-f1d4-08dca75864a5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:35:26.9021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQQVNI+igzFMydN5fk6MW8P0/Th3RhPhGXODGoW4ZnVNHiMQj2M/ILEz6Lf+zR1A6mgR9EuEFkuwIdFDkprbSnie9u+cZQKof1MMSTxP0Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180122
X-Proofpoint-GUID: hN9Pe-fTgAbqeG0S_JX47Lcf_Mg55bgi
X-Proofpoint-ORIG-GUID: hN9Pe-fTgAbqeG0S_JX47Lcf_Mg55bgi

On Thu, Jun 27, 2024 at 01:34:22AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>

Again, stuff from the (old) kernel side of things.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/enabling.h         |  3 +--
>  include/dtrace/enabling_defines.h | 23 -----------------------
>  2 files changed, 1 insertion(+), 25 deletions(-)
>  delete mode 100644 include/dtrace/enabling_defines.h
> 
> diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
> index 41e50cda..d36a73df 100644
> --- a/include/dtrace/enabling.h
> +++ b/include/dtrace/enabling.h
> @@ -2,7 +2,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   *
> - * Copyright (c) 2009, 2019, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
>   */
>  
>  /*
> @@ -15,7 +15,6 @@
>  
>  #include <dtrace/universal.h>
>  #include <dtrace/difo_defines.h>
> -#include <dtrace/enabling_defines.h>
>  
>  /*
>   * FIXME: Needs to be rewritten.
> diff --git a/include/dtrace/enabling_defines.h b/include/dtrace/enabling_defines.h
> deleted file mode 100644
> index 875b49d0..00000000
> --- a/include/dtrace/enabling_defines.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/*
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - *
> - * Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
> - */
> -
> -/*
> - * Note: The contents of this file are private to the implementation of the
> - * DTrace subsystem and are subject to change at any time without notice.
> - */
> -
> -#ifndef _DTRACE_ENABLING_DEFINES_H
> -#define _DTRACE_ENABLING_DEFINES_H
> -
> -#include <dtrace/universal.h>
> -
> -struct dtrace_probedesc;
> -struct dtrace_repldesc;
> -struct dtrace_actdesc;
> -struct dtrace_ecbdesc;
> -
> -#endif /* _DTRACE_ENABLING_DEFINES_H */
> -- 
> 2.18.4
> 
