Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A758F21ABC9
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218678; cv=fail; b=qKLK3sImhyGF7WMwQdXJilxXdDjFhcuadHTsq7KnYPRD8ts50pXAJ2lmYm6KwSKPFjwvH5ZiNaPW5TEMTCeoRuWfAiMDvqRcRJLxiGQtjFFpqGrOPXUABSp4jVzFD8Pamna452nSlQ4T0MkM5IHIywgRHQFacS2Gv3H1YWgmELM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218678; c=relaxed/simple;
	bh=UKHfD9Akzp06OfNYyCURFgkLkpO8KZdT9Skz65GmjDs=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=HOj7rOAvxG4Vb30l3vMeAkeIn4VZQgWY8woL/WmxNNlm+QMJBiPH4ct30SPOxoQUspSjGnPfX5L+A1zXkTx7HXTawEVN8Q2hcn9r5yBs8JY8aQ34SpKmgl+ka6gUPnuhfbcDnTKXWDQHPfa/S7a6cu6kenjQ/ZYsyhVGZlvoB+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DOyTmyvY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NraK/OlD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DOyTmyvY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NraK/OlD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614DOXC31716428
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=RZWedBzxcTxTCHoO6SkDcgp+YZgZGUrV7UC1DGd9zus=; b=
	DOyTmyvYgzbVeahnByNCjS3k+b2szrHJLch6L1QM9ERIDRxO4yb+uVlXuRqbT62J
	1x3/7cwHyLFSPhiV4og8FW5XsNCoXZLYLkf7BwlmrvmdXatDBFBtH4WoxmHjW1xZ
	996FhQPeO/ZwFYGdjBPtvAQNqMK5aRkdWDmhVfcnbbXW+zUi5K7oPJYCgAu8yu/T
	bmSjn+3aEphNdEFv2FR1Q8ZLWEfxnQ8Jg8z/U0NsuK4P85fWdQHQCGJCf/9H1ZEM
	XhnUiG3x1P+yZaFJrSRtwDz6KZrET7JW0mISeA0ys/vCrYu5AYYZOIvAwRGxI45p
	gicsCBUVyah2tJ0ZvrDrdw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jhb23a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:24:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614EetcZ002072
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:24:36 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186p3dt5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:24:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbbncvTqAPsF1Jep6HN6AFwawFd0mEvErE037FCnESUcCdVrJQfaNxTUvQuV480IRBXedt0DAq0JcJ90iUsIMdMGmSXyO1UwRX14Xl2sZkQPuWc6ZKyCJuYTAJtohWG95XBjfWvKzhKb5v4dWj/oP4jQQ42skwSPXA3/imddDq/E22Ex1J+4K4Uk33i7SO/Qc/wTWEWT1iEy2qzvDyupxQzQd3uz6+N1t56lZ+MYLvWm/RQRXG27+YcCUEw3YTt7ot/6xEiX+ubYfC5o1zJb1cJCVIyhNKvpRB//sHESqPQE9FNNtOEKq6aKpCWkAsfnLSbcKTknsk0MKwFdhRHhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZWedBzxcTxTCHoO6SkDcgp+YZgZGUrV7UC1DGd9zus=;
 b=fv5PaDOulQFTF8CxLkmfi8RJT3vpA4guR+SheXaJOBeRsYWKqPARxWzn+nGY/PXez6aA7uKqaXDn4PPMAfQxCixcuyyhAyavbKYi+SnJPXzWXs0x0dzsnnAEfSUl/hsQmc/1mCRcJeqqicdI8DW/8L9EhTLJidbr5hCXHAeKT609V/xi04YwRI36EbAynDKZmPMw+1y0jjs8sAkAiF0neTIHfjaIuES2JuPmCGiU2sTVrD9S7cNZo9Qwe3udcOS9wwQDUN2V3G9LYT7TcBrfn4gUu5AMB577umY4sbavfDm7sCNr7yZBmlKHtTly7wvxxO0QLk8rc4w/lfj8MQn6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZWedBzxcTxTCHoO6SkDcgp+YZgZGUrV7UC1DGd9zus=;
 b=NraK/OlD8Y2CF1HtJHwmeDMa1HPgBYaVIRfc6gBFplQVHLbGVFJXaK7LzQjNZXAXVK8/2+fJlC+CGA37MzgNJgVjhHe5IdLPjAk1xnV1lUzMoR33QYwHFcXVjVBx67LjPWIfKsej3VUhTsbDSEX6n2CEsILl1JaL7cwdV5GZoKw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS7PR10MB7323.namprd10.prod.outlook.com (2603:10b6:8:ec::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Wed, 4 Feb 2026 15:24:33 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:24:33 +0000
Message-ID: <73af7dff901f1bc84f6504c90416d3f4@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Tue, 3 Feb 2026 14:50:19 -0500
Subject: [PATCH v3 2/2] usdt, stapsdt: fix argument handling for multi-location
 probes
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:510:5::34) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS7PR10MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 379422a8-7132-496e-c30a-08de64017f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WKsAIiiBjF3HWKZFceA/eElbsKu09MiK6u0s1rBGfA+YA9lrfpegQTcjLf21?=
 =?us-ascii?Q?TuNL4CC6tSj5PJuxryEHFEOLlFB6j/8JiPYeAtwXMc2+qzdLz3mpX/hf1B2N?=
 =?us-ascii?Q?+i69K9WJqDnn+2yZLaU8isEo6XRg9IsDHUvvkFMYWkjydAJw0pI3JJsHuQqj?=
 =?us-ascii?Q?uzd0+MX9tZmgbSjGW9IBbN1pECM4VXGZo+GjkJN+jwZ0oYF9XExl76gmmPHs?=
 =?us-ascii?Q?kqO1RjWlV+wZQn0tcl8GeJYKeJB3oE6HOwXc67tZbKWJ6hw02rhkut2s7Zrx?=
 =?us-ascii?Q?8HqpH6sP0ZNMJeJd6uP2lIe2le4soJzcmyN3TNIiTXj5Dz5NgP9z1jJM3UUb?=
 =?us-ascii?Q?kdxHeNQ4fJ3BFOW987yeTdm4GHOVPcfbpuelC/CBjcX1BkbQ32YxWiMjis2m?=
 =?us-ascii?Q?daUGogLpo9HWpgSasD33UtpxQlqZ9pzLziaL1zjQVWDPtghr0sEpQ36ZvwIe?=
 =?us-ascii?Q?uow+9GiFixh4H1r00xlaK6mCNh5W/B/aDuNBCpXiVear4h2/zwN5Zs5pm5pV?=
 =?us-ascii?Q?/kIoNwaRkUAZeZVPBlU9m8vKeKZBXO+IxxuNH7J5hwJcm0+gUneLMdu48Fiv?=
 =?us-ascii?Q?TCNhwsTXG2hQZ18gk5XYBQPwS9J3DbAhZDu39S4KPVWXzZby3/ySIRpjxn8g?=
 =?us-ascii?Q?CipmklIGYMnsFws1LuyCRR73MkDI/U9R5XPT8FHdoo5pdZClJln8bFXJ71Us?=
 =?us-ascii?Q?2FTiU+ckCDrP1hztI1h9xE0hz9X9JcmBL3gbv6jma1/oyq2b721j52KyQbgT?=
 =?us-ascii?Q?mh11ojb6150kqzxercPbCkwuvkSgg+hxe/eRaGBBe2UVZSU4JBG0uWNEJisI?=
 =?us-ascii?Q?Y0NzF8xbEdMIhKrnWQnBLEPkew3hWOKKPIPMxcg7RsGa1omwaHzsDsWzp9vZ?=
 =?us-ascii?Q?d52zRYJGL2ZKJKl9IFw7OMIQT/uUJccpksMZaOkS9EoN3B00zFBBgF2FuY+Z?=
 =?us-ascii?Q?HEi6+3rYm7Uw8qCq9dxN5oj+i7KLpvF6bH5mjUfcfirh2LiHTZubjPboHI+2?=
 =?us-ascii?Q?Pm30cno9lXpm5lB6tj5/n0S+B01mq3N2jOHM6garUaVWi2+5ES1M2Y2aGPl2?=
 =?us-ascii?Q?Bk0gRTfm18X1EZsb37XITiNsElUKyN/3SbhyIiRIAZXM0f3KmgtOvPpQL2Lp?=
 =?us-ascii?Q?CV1aCdGY+kphI3gSu3g7IihF2kv4HJqlP8KW3Igs7gqyWj4glVpUD1Bq2sgj?=
 =?us-ascii?Q?zxwnX1xwet9zOYD2O65S1FWMvrjC9Amzi7j7xQKSm2M+0DkncsaOSaL8sOlt?=
 =?us-ascii?Q?JEbfHlrQRlPWO2FHMzBpqOEI/P+kv7+RB0JNVMUBHG+ObB2QQcnVuZcC5MzV?=
 =?us-ascii?Q?Gk4lUWUPYgmjLEGkoEVRTAxnQeSc3Krb/FpdeIDnOSSjO42279t2aZzHkUng?=
 =?us-ascii?Q?39mvm4qexmLeoPHCH3U1QU/1yX9LzZQbzj8ZOZIptbPrAQ9xmeg14yzLbr1U?=
 =?us-ascii?Q?eE6I4eZ4Vm75b/2yPp7EUnxQfKmSRmafykGmi6Hl8nsnHVLzHXl8hMOE7kP9?=
 =?us-ascii?Q?w/kcnSv4lKxNbWDJPFEKdz5HjNrGbFsOGV1yvaDPD0xFcFw79zzRBeaaN2Fy?=
 =?us-ascii?Q?m1GFUZ3/zE1ygHPJ4s0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hVNQeB82mXSd7qU+axbHt51FUzN2Hhyq5XASDjz2ecblsreaNN+72BDMeGPA?=
 =?us-ascii?Q?fZrfYXfMKTnlN1mn+OX9TBQ090z6g74nHTJhPvc+fhXVDkiZyJcO/z2kNn+l?=
 =?us-ascii?Q?9YCBeKhDjTwKgvs+J6r+S6nQqw/Hnijdce6iHhl9VhPPsyRWs6A5iK4B2JO7?=
 =?us-ascii?Q?JMsIwO7Q7nJ2cstFNyFvDB213Sijo5/GX58ZUsIK6KrE/Zk2m0kI7QH8Wj3T?=
 =?us-ascii?Q?7eBHgQfj99BHkQww91Swg/dGdTb0w1q+R4/sT5Udhl1FCVV3dklIYIRy2kOW?=
 =?us-ascii?Q?NU98ceaNHE72vZy4fdIococMgFD/KBVMXzLvxkNHzHnxgWnmStnMqWffrw0m?=
 =?us-ascii?Q?oIdWg6MZJ4RjeWL249M3jJstpgRnwIkcmVA+sdo7Zm5RwDcqipScETujGhg/?=
 =?us-ascii?Q?dyCHHMhe42UVADNvKAXCOctGzAqHcOUHox4QnoaLRgtQvJWLAn4+l8iwl3hp?=
 =?us-ascii?Q?RSweUOqDp8JJiyP5cfhvofiwNK8TqX5a9rLrWgE11x10FeTsadTXVBl8IiPa?=
 =?us-ascii?Q?gaCvVyzKdISuk3GVIR94pU6NZilsylzl9OmzaRbCYNc+YGzB5N4XmWo4KE7c?=
 =?us-ascii?Q?4LSfaug4RmzTbn/+cTbqk9GlIZfB927VSy3GHrcRbqVr/3tiQrhp5e5GyvOs?=
 =?us-ascii?Q?FG0DvvW+/3g80Afx8mWJbyZPIWI3gtp5nBlYT9KemhDgc1D71USjWq+Pmfho?=
 =?us-ascii?Q?bik0dHAbmw130QH73hD7sygvbTNDeZynaORiDaUm8MAennLOu0m4FCmMlgtF?=
 =?us-ascii?Q?aVQ+qfCCIEFYksALa439A14Nr2cM5cOSPaLpYuF87VkXTDreXaOb3R1Bdh+l?=
 =?us-ascii?Q?b3K4/t1vvyybNU5y97df8CM2RoJNHyK6x9Be6xfkFyxf9IrtFK0b/vONvk/y?=
 =?us-ascii?Q?xP9CzGsLVnwHSTh/51+5ocDOcAXl72oSYUVA4rAlEHuDYAtkvDqXpnomS89B?=
 =?us-ascii?Q?SL1bbl9/e0z387KoqZrXRldZu0zzo1NmuX/Ya1FXnqnd9McnZPiUELn05k4x?=
 =?us-ascii?Q?tQCCpXKSlXxvPsO2xc5niTc5B3wmxnoeee87CnUr9YJ1Ut3CtX4t5qAOiw2F?=
 =?us-ascii?Q?pRGHdq37qYiaOISRgPACdjtWgVrIcZG/Qwrus1h80EjOaQa7GGrlJZV9Xv8i?=
 =?us-ascii?Q?ZSJxBLjM0k70ped2NyhbWJAVfSXdq79m0X+pwpxmU4lB8y9rZyzTc0+AWf19?=
 =?us-ascii?Q?8y4T5blFg9on4AR0qcmMTgRO3UGJDOCPrkRpnrEud8p0MGR6KwU5ky6X6qvn?=
 =?us-ascii?Q?OOzKuWPqgI0tu9BWHNz5dapC+Xom258CHul88p14OGUgkAb5uOrrRu/tFc8Y?=
 =?us-ascii?Q?e2ZGARRJH6+9fxhP4T979ps/m1IfSlzKlK5xESrAaW4QEcQhZaJajBwinuE+?=
 =?us-ascii?Q?+AhHwfKdzxhHwEwpyvTaQ/3MkqHrkicnfdPQhhjBvNxBjbkw0x/Kzy/nB7pB?=
 =?us-ascii?Q?Chd8WRFn1sSN22rTHumQabvJuL1smuCFP58r9n5bJ90nBt1loZcSoTyW1k3g?=
 =?us-ascii?Q?Vvbb3xfAwHL8hw66ZhgkpbqdQWoMJp5cnDlcnbAEfaNlUJ1yTbUsUT6RTnzM?=
 =?us-ascii?Q?U6J93MkAMzLQBvCoqV3x6KJsxq+887Xcr6SECquCkMtmwcvlJ/U7Bv2s90et?=
 =?us-ascii?Q?c70OWBWh+Z14NI+Mr1Z/SriLgAjhtrnW89D9Zsyjr/Jbs7V1ht2jydzEseQh?=
 =?us-ascii?Q?MSc+K57lLWLrG/tpF2x8KxbHk40TH6VveWBLRjLrMORSolUSNOJ7IKLVtusL?=
 =?us-ascii?Q?Ttf84UyfUOFWYlPYCaA2dblzcT660NM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uqmpYr5mNZPffZ57Tg/V1vMI5p16Ii+Bqx2qSuq2woPReAAI6uAbkADvlrAuVoCX380h+0XTBLFQLQIMJmt0+iWhIji0KvwY4F3Fg3MuF6NVXTIirEjvP/qp7nNiHFJMGph33zWWoGt/H5tC3fBh86T6N6ol4ynVobBRgWRV08ZqFPWZCFjLLM0XfWiDrbnc0A+zX5KuwW03whmDgwB3kIaDhhl6eRuN25IUw2SR766PjNPvXy2bOT/8tNkCBktm8SZPZF6KAveyKE2xoYVTWu4fFqlGHupd0mgyhhlQRqVnigux5y+8ZelYgP48Mw3NNBMj18fDeETWZJWahT3vGBA+f4ZKYNTj+oV703iWrSvSIE0pHt46eHk75HW+du1B0VicUCBlpq+yZyYrDT+vtObbun9qZi1hyCVCsjt6cbQlzRaNphbVFyH3MZajh+fWrrrUgr1elN3f1a/Bn6zc0z0SgYrw70/4+OFRzUxmZvesxP9k3X5KneoT4I9GRDLKOpZ9grPuMGGUhbMrwGmlEfEBkvOk8bpR9BdLvizNJHRP7n/gxoAZQM68OsuRW2fIRXMlCAYX0CiBGC6WArIUosScmg9NE07lUo5cvMFzAPU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379422a8-7132-496e-c30a-08de64017f5c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:24:32.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlOrTyK+XQLFRjmD5TfUZovaORYQGqZZRu3V7We3Y2G5xSft2FS3PmEAfk3wFkfc9BMvhvrFMegMpDSRfThgaXnjcLvcC+LmGcufF02q+KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602040117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDExNyBTYWx0ZWRfXwU4ns5NjCZM3
 6Ozn+ttjOc/VdXBx3v+iqV9hwf+zwccZ0CLpFISqgYTKo8Eo8odIS/hdvhH4GMGgePHQt2J2NqK
 kL0aJGyaFPrbu+xyzOEYkLHPpIAxuegaEseTKc2lbXuY7AAe/ab4E0mU8VqlhznM11Iu64B6MIf
 W9v6Hl97qS21mTkAGzadoLl84Pfv0YeJLPqukDbjJAuH2CXT12zx4b1JYmuWHBaRYHKnnu2Qvh3
 pBnr2G9gUfEQm4iclineQhmvWAAZhUJoh+DLjbel1IpZKdUDyKA8LyWYQyw0UOfrMr1sCo3nIKC
 7trJHNZ7hYHo0le/SpbDLGPf96cjADgHrTS/EHYVvWcagLNFqdpKAFRDinr33OURatOPEumUiia
 JFuQduStj0+20Lhk4MwFHyQxUNN5O61sTf5yszbOHEILpVNZDzyeehdK+MXO/X9jkg+lJj8ZUet
 R42pt/IgCPr8kb3q5G9vCfanbOGifeO2WWf5ZNvY=
X-Proofpoint-ORIG-GUID: cxhRJYDWlR8XNIbzJ-AYmyYXXjJDYdj-
X-Proofpoint-GUID: cxhRJYDWlR8XNIbzJ-AYmyYXXjJDYdj-
X-Authority-Analysis: v=2.4 cv=CaYFJbrl c=1 sm=1 tr=0 ts=698364b5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=03kTC6tBYgzzdIcB37UA:9 cc=ntf awl=host:12104

When a USDT probe has multiple call sites in the same function, only one
of the probe programs retrieves the argument values correctly.  The
probe argument data is collected for the first underlying probe, and then
skipped for any subsequent underlying probes.

Since it is not guaranteed that the argument description is identical for
all underlying probes (although it is almost always that way), we need to
process the argument description string for each underlying probe.

Orabug: 38922360
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pid.c                            |  9 ++-
 libdtrace/dt_prov_uprobe.c                    | 10 +--
 test/unittest/usdt/tst.multiloc.r             |  4 ++
 test/unittest/usdt/tst.multiloc.sh            | 69 +++++++++++++++++++
 .../usdt/tst.stapsdt-notes-bug38922360.r      |  4 ++
 .../usdt/tst.stapsdt-notes-bug38922360.sh     | 54 +++++++++++++++
 6 files changed, 140 insertions(+), 10 deletions(-)
 create mode 100644 test/unittest/usdt/tst.multiloc.r
 create mode 100755 test/unittest/usdt/tst.multiloc.sh
 create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 6f93123f..a379a0fe 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		if (strcmp(pdp->prb, "*") != 0 &&
 		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
 			continue;
-		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
+		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
+			char	*p;
+
 			psp.pps_sargv = prb + strlen(prb) + 1;
 
+			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
+			     p++)
+				psp.pps_nargc++;
+		}
+
 		psp.pps_type = DTPPT_STAPSDT;
 		psp.pps_prv = prvname;
 		psp.pps_mod = mod;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 6d1c0f65..e575b072 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!upp || upp->sargv == NULL)
 		goto done;
 
-	/* First count the arguments. */
-	for (p = upp->sargv; p != NULL; argc++) {
-		p = strchr(p, '@');
-		if (p++ == NULL)
-			break;
-	}
-
-	/* Record number of arguments, and allocate descriptors. */
-	upp->sargc = argc;
+	argc = upp->sargc;
 	if (argc == 0)
 		goto done;
 
diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
new file mode 100644
index 00000000..a0bbc7a8
--- /dev/null
+++ b/test/unittest/usdt/tst.multiloc.r
@@ -0,0 +1,4 @@
+main
+test:main:args main
+test:main:args main
+
diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
new file mode 100755
index 00000000..19d5d6c1
--- /dev/null
+++ b/test/unittest/usdt/tst.multiloc.sh
@@ -0,0 +1,69 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers USDT probes firing from multiple locations in the same
+# function, verifying that argument data is correct.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CFLAGS="-std=gnu89 $test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+#include <stdio.h>
+
+int
+main(int argc, char **argv)
+{
+	printf("%s\n", __func__);
+	DTRACE_PROBE1(test_prov, args, __func__);
+	DTRACE_PROBE1(test_prov, args, __func__);
+}
+EOF
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe args(char *);
+};
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
+	       copyinstr(arg0));
+}
+
+EOF
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
new file mode 100644
index 00000000..a0bbc7a8
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
@@ -0,0 +1,4 @@
+main
+test:main:args main
+test:main:args main
+
diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
new file mode 100755
index 00000000..ea0d6880
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
@@ -0,0 +1,54 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
+# that argument data is processed correctly when the same probe is used in
+# multiple locations.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CFLAGS="-std=gnu89 -I${PWD}/test/unittest/usdt $test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sdt_notes.h>
+#include <stdio.h>
+
+int
+main(int argc, char **argv)
+{
+	printf("%s\n", __func__);
+	STAP_PROBE1(test_prov, args, __func__);
+	STAP_PROBE1(test_prov, args, __func__);
+}
+EOF
+
+${CC} ${CFLAGS} -o test test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+
+$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
+test_prov\$target:::args
+{
+	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
+	       copyinstr(arg0));
+}
+
+EOF
+status=$?
+
+exit $status
-- 
2.51.0

