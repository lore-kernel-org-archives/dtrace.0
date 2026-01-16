Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100F618DB2A
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601724; cv=fail; b=CMe8+PgAg3prpzHZ+weP5w3gMJLSVpZrTWQwWPFMrxkRzSZFw2x+I9euDo7UtYTzuIwOwT9Vl0k7UBFIJerttx6ScBAI5BtBhRPl3vZzBpsCLpQeh7myc5pqrh1mv9pKSREjQB54KaWMsISCJoXQAcIZu7Cw7cZCpSdfAHTmwl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601724; c=relaxed/simple;
	bh=IPBK6jfyviCF9H0eCQcbJtib8+5+w/oF/D/63JwXEQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qMAF2s0HKwn1IsZUWPpZstFydxws41IVoJcvEmDQWNw/6UB1JSGp8al/314LmUDbbVsaE+wuXyLN5Kxw1zTGRHwW0+slDn/IuFQygjv3AJbXeauyME3NpAZbNM2jS6SGn1oEDjatEyAwB9IcTdt9uQsKhvcOfr22rBuGxBS58k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d66vhcbo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W4fdvvyH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d66vhcbo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W4fdvvyH"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKW48u3753479
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Hf/uYCu45Ll/YvpXA5
	zoerDt3KR1GDfnp7Eamr0TX4c=; b=d66vhcbojSpFq/WWb/m1Pd5FHhkNZp1PB0
	3mZtVz9/Sp/fRbPH8pTbrtOGuyniLFRSg7eAiCilgnR4HiQULZL1BVJTiMZ3NbSs
	clp9COs5XqcBIAxY1QDS2aTBKq1DKCbTFub3G98jOaCFRWyNXZxaQRw/CeKXAuzG
	Zrnl6mulD2hwBEwpw5t2nSLqIS+8+YxRzt8X77fmV2Au16kRGdmfr5NJTBoI8BZN
	28br5CKNtz/OcqQey8+SDfDp0EhuvOTVKj4Z696HbOeIC59bLGEOBQcpFipbOERj
	oKINjTsmaTbt1qF6uY/vypTFT9/yjEDIrmddL812ge+tLrVHOVvQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvegg3xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:15:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKKgNt010756
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:15:20 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv9m3ax9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecKxwD6sEcoDJ0fXBaTg5czBHnWjY/4w2ErefolqmTpbikV0UBOSPzwlDdWlojwG6tz8iXrn5bzX0URgxHZ1SpTLH48IMwkx6mIVfS0U1xun6sGhOWve20ytO36X5pXKh0g0zqn4HVIr0B7u3JlIBUfpeejSOA0bmCT12LuQm+8djfAxaORM699nLHLWmeuPSVKOZv5T8iYQyo1P2bX2Cd9AaYfrM+Qzii8U72lvIheT8jH5A5EDV3vqblq9oXmg/3kb/XjbJ746iGAIHtuhDhuqnJqVWeQ1g0Nx9Orir8JZNJcw8XAipPRlL9wOyOynK8TFI2NoKbR5g/mHCPjvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf/uYCu45Ll/YvpXA5zoerDt3KR1GDfnp7Eamr0TX4c=;
 b=pOM5C44pSTT3IjTU2qJQA5DR8xkDklrGyzi7w28MIoVq8YD9wi2pdoi+RY24ggE9yffFK83Jh9wRdgLJ3rPL4E47lh2rWysMr15BZK1seTmY/C++GKYMenuf6/pZ+3unQLzz89ioYfljmz7GeQvc64JsdJaDTliBiflfL6Dt8FbGUtPDYwns8Xtoo1+aygeObfSyaX4G8DZVPj0RcWnQ/RfQ38PkYIvNDT6QhCv2AiajbAn1mAbYIc1IDUtAkQrTIacde1g2gpWiDEOkLIyjdb95YW6fm5LviBtzrx449x8FmM3tS3oTP5lkcIe2lmePcAk3Ead1u9lZulCgtTmDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf/uYCu45Ll/YvpXA5zoerDt3KR1GDfnp7Eamr0TX4c=;
 b=W4fdvvyH77MIZyek/ZW/EG25Wckwr9C+Z8nbUJxyOq/HHx9Zr5uJH7IOxcCmRSfYKz2vnM9HeADu1btUqgkNFR/ULxfj+u2CX1r8Ikyp42WHT2LiDmuHclfN0NcfZRIg1RkRGLCSVbuvqRSbt0ZgsWg+k/HewxW5vWgAupkBP+8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH3PR10MB7235.namprd10.prod.outlook.com (2603:10b6:610:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 22:15:17 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:15:17 +0000
Date: Fri, 16 Jan 2026 17:15:14 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] Use asprintf() to allocate strings
Message-ID: <aWq4cp7iqmcbhnO5@kvh-deb-bpf.us.oracle.com>
References: <20260116185529.19682-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116185529.19682-1-eugene.loh@oracle.com>
X-ClientProxiedBy: PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::19) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH3PR10MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a87b404-021d-4722-0410-08de554cbabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9e6e9ImHC9jbJnuOFEOSRtTT78GvoNKSNguB8rjx0FsBYz8wHbbnw4w4BLGk?=
 =?us-ascii?Q?lHeLTtKOT6+pZSir7dL5VGMxyVbPurP8vf2IeqiBgeIZNjwmksv2/ADCc2Pm?=
 =?us-ascii?Q?0cMaxeavwScrQTXjaNrbiwBX+YkwEstsXXt+NykhUVv9xijeq/bVma2M4Fwr?=
 =?us-ascii?Q?u0LyqcrUeFGH3k1j9QufL+VENUZ0w84gKbG4e0vwy7ngn4oMHGTvjKK/8dfE?=
 =?us-ascii?Q?qcWMNEij+kGQszpDib85wgUJlSIDhm/+vS0TVyF2Kh7T3cI5WCQfGk/TcMIe?=
 =?us-ascii?Q?jTbYJmlTnOIWfCytp/ZF6eV3TAChFVAzB1nsfPM6DfBMhc0BMNkiC9A+UEr9?=
 =?us-ascii?Q?6AISFAK2inc1j8GRsL1/Rsm0ZnlLrKdz+84iIrttjhoweBSLxGFiieGFStE2?=
 =?us-ascii?Q?2xfBlmhjFqAfa7GzkjY2QWNeWIjWV4JE1f3tSlr16Ns5xq8n466i23wcjbx2?=
 =?us-ascii?Q?yf5MOg6qgdBik5h2UwtmAzbCBMxoLYK7gNoHuaQ7HbVZiSZNj/7yKF1IvOie?=
 =?us-ascii?Q?Lp5pn6xMnQqDUa1FdoL/EQWSwO+w3ay00YOdXItMdZfWsysKTQL77ugm/wBF?=
 =?us-ascii?Q?PJNBZDE30Y9GFbZTlalvVwvjvK1EQ+/Iq1s4Gj7Sbm853u0YBXKJIcx6/S29?=
 =?us-ascii?Q?k0hTmiGtp5wvBrYWr7v49nr+BM6YaoQTLrJNyEYtaHHxr+6E3swn0Mb89G0D?=
 =?us-ascii?Q?wpr1hQFrcSeUpSVKtb2JJ7s7xUpuGnL0oLGEwLa5MePHHgShRR88BtjoPcoi?=
 =?us-ascii?Q?ThXXcJiWSpS8fWwKfzHW9BjgO3yzd/fytsJ6Ny5ab/NXiVxEg6n9ugm/Ulrh?=
 =?us-ascii?Q?DHeNJ2IeqOVU+1bARopld0MCwC9INDw2Oib6u2koXQ1IKRZe5P9VOJITB8yv?=
 =?us-ascii?Q?3dWPYg+9CRtcP3Sz1aEIn0Ugxlv9S2HgnEUy2+DvRLdqDSu/gKstuO1WtqfD?=
 =?us-ascii?Q?kfMUffW6MAWUckMyAN+IwpJ2XU2NKL/b6l3cGXqqO7MpwjJKfNqGlIqK7Rrd?=
 =?us-ascii?Q?V5+GsFWH2gJ+w23pULHgMBSm3gPIgSbMjZx6WCRRihha7f1P7dleB4wsXOKG?=
 =?us-ascii?Q?JiGkYvAM/UxH/oHaMNDxmawAafNnAlPt1+mM+d1OvaCiHSzVJZrf2VW9sWF8?=
 =?us-ascii?Q?qPl4uVZh8TI0Wljp7QXrigct8ANllP/SxrqmcGsglJxKY6ADEwO3aouwV0b6?=
 =?us-ascii?Q?CLTQ0ExNlNCMem4tHZos0qwQNNqS64HNhAmDViC/rKTeS9yrheE2NKuOBQg9?=
 =?us-ascii?Q?wcV0EhVckjG3gcNpzCnVT6T/VGV8kO3GO4ayl0gcGjLSb2hY5q+S9Cxa+AVt?=
 =?us-ascii?Q?FYJ8XVjQsptX536BnAxKyX6kc2zUL4bWOxSnjeosGRKwEVb/CKWdpwSvHbWD?=
 =?us-ascii?Q?GYvdyuoZC1qEDSpbAd6+INAh7mH8uvYCzYyueciWKQOPafm4iNLKwsJch4++?=
 =?us-ascii?Q?t14QrpdiCCoKsB7hl7VoCIEBPSS5r9ZNsjBg6kZhiqLye+WOPt96NXk85WZr?=
 =?us-ascii?Q?ndWmJm1I/BED3ghtJ9vvs5BsI/UcW8d/qqeMMpzF+Sa8RT0ZQz0j8gNEn9By?=
 =?us-ascii?Q?voF8Zjd2hP3sKfRirZw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u/aWgBzdjgcl/PBfpieS5NDA/9aGpKw+fJDyQS22zMBahD1RZGNDigrF29Bb?=
 =?us-ascii?Q?jKKCgxSiytKhGPcx4/fTRG9NeZDWlqklaZd7GQ1w4go3XfhBxQF/7JNEiLro?=
 =?us-ascii?Q?pWvgbjc29FjWxsDRg0+M3vTpzHG1KXc0fciFIeNlXxL5Y5s22OuCZuBmiF3T?=
 =?us-ascii?Q?Psrur69egdXuOrgZTD6VUIcv5hI4+ImsDsdBjSKdjMQrNLkkRnfjcH2WXZDY?=
 =?us-ascii?Q?DxY01ziGfeNZ+KuFfXpHTIiiXy/nNsauFeILvHQwtpCRgZexxuG3JTnOw5y7?=
 =?us-ascii?Q?IkL1ddTgi3nKq7ghAYfKqlHruKp/dk65EetPfDpgSCuY2elYnEERES2XyFSy?=
 =?us-ascii?Q?sOMWVjdz1eNQopyyV7uraDaMzNrGboezO+y5klVDaSR78faoRN2XnQbbMJ+X?=
 =?us-ascii?Q?f0vkqRgBvVFkEqy1zGHmFgw+AYpA60v2XTtGbmOAV8kpN7CLuD9pXsTRRDRd?=
 =?us-ascii?Q?Iw+WMOA9wpExxOb8xivYgUZS77YR89nVAGsg9UvKsiR3RjbM0mg9oNgnORYw?=
 =?us-ascii?Q?TV/+R3s1oERIjPwNv6ujdNlB4NUqvLmrL6PBOeNAvbmt9/gVMGn5M5uR1ZVz?=
 =?us-ascii?Q?uTHqhBFhy8iM3hzsn/t3k49HrzlCZBxt4H+GapDgRWBSDOMHjmw1rK/0zyos?=
 =?us-ascii?Q?MjSuHvhC1I9V4EccvC02PtmpnfL084qkPZAQzjKhS1u2zsyhSa2fVY9HjUf4?=
 =?us-ascii?Q?DoogUBwcVG5+qdojgF+EidAtuVpRg0mCfKVt0PCCr/pneKR5vPnkMrmfmhxS?=
 =?us-ascii?Q?xTWdZUTB8ulSKpCtSlM8NIZRQBZ1EhMRkndMNFIWT+V0uv6BPtOmao4MHNnG?=
 =?us-ascii?Q?2IVrP27mGncQp2G4oJo5OiJ7QltFjb5X03shjdc5e1vdl0KBLrrYZdgJ50gX?=
 =?us-ascii?Q?E/ZR7ndZgiw/pFZw2DtTY0blfwXUd6lQmebTQ1vkOzai5I4xgBS+UoEEBw7j?=
 =?us-ascii?Q?kAM3Wm9lx1/cRN54NiukIKx2ENIHPbBQhv3jyMU3PRUO6WzAR2dvgXOjPZmo?=
 =?us-ascii?Q?YVHYoeq5r4Fh1DSIhIbef1q3tiiDltZDuyhvlL7PWUGnzv+nj/gZbMUVrjpO?=
 =?us-ascii?Q?AIOEmx+M0y80FGLCJP7BzTSuPJEHAG2smoLk489dROYScR6cGNRb/NRpxZVL?=
 =?us-ascii?Q?a0ouOVahX6Kmt7C3jjhARIQ5r3b9HGAEEjMgqqIHkbXgiyffGjknBUdznywg?=
 =?us-ascii?Q?4Z+0+V18VnHL3oQ2l2S7YkQbeHHUihpv85LhYUGSkSpnrITHvSGN3yOL7lct?=
 =?us-ascii?Q?vUa80NkmMeqZ8VUEPGz30aEc4ba8pUR8rTtbVW/m51tojSNSqetoaLVzpf0E?=
 =?us-ascii?Q?YupJ9qlNfqI9OXxPfrjPhXw+rgUaVmSpptVJKhnD3I2fPxyVhMF/r5XLAPxg?=
 =?us-ascii?Q?quEqTa/CfVb/5sA3Tkitpm0NakF0HlGpM3b8AnNgBkmKv9uf/kua9NrVZhIh?=
 =?us-ascii?Q?djrK9CfetX3ivy2ZClsWTfsMKX05kZ1ObP+iPZPNeoT4P22Y985AoYTH8m6Y?=
 =?us-ascii?Q?C5EpAhH0jZuIejbHyMWaFWjiJ2d1LvuLSZr33QpFvL4lotE5KhVN9kdwV0fs?=
 =?us-ascii?Q?F+UQ/2b7GG8oBkroq8coQuMnv80fy1HccHXbEomCq8uacAWhePfUIoKeTFDf?=
 =?us-ascii?Q?+ka6wITv0MCnGvV6ZWkd9l2nKg3jF2rcVp/23dW7Ww/QF0iGLtTWpRZTOx0c?=
 =?us-ascii?Q?ZIQAmwybgfJkNQCcnDXjdJTJldDHkILZLCr91lyuipwysmZzqckiOSDUGwsK?=
 =?us-ascii?Q?hp5MVoAWqFQVEVH7UG7HggL/Sl93UIw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KKaZ3+o9/5FR1ge0OKV9HwVJPIuD+OMyB7ZeIVULVd+eyaZrJUXZN5UeyGZYv9kifgpfTbjyMJ6N1hhp1vmKdZvFGiYDiqgHlKy6huMgB9R/qJi2AzYLQJVWRYq4MGjMHApeMepKEAPRAws6wWMEQDF40sWt8qGsLpIpw2qW4tjZLotKqHqn9mW6pqPAtScpZc+L+i2Wn2jSd0QFR7kQVX8fPcr78/2f5xGTJoEwYEUu3QUuy5qwDzs29kZ3vttABOL2sqXK9szu8afc8fxwNlcOy/KWWEMDZrPI6ZI/98ySfAJO132VCMhok9Ldyiz7aj+AEndhfHi3EwYNqDPiWzZjjienSEtnQ07vurPCegftXdUeZfeocmiMlsIIGseKxBnDVZRo6CPu1XvizIiPhZ2lWwa7JYPwrAUdWKK4xz0ecVNPR0Me+tKyUVTxsl8N+BHGex8idqWmHGmQtV+28g0OlB8QyMYUGDh2gsAtjDYizwd/Q5j4mCTo3r9Pd1kdu+R1nQTK2J4EF4ZeRumXk9pJcD5cdhf2Gb1R6skbmjlfd5Wl8yxSM8rA8VrenaHKTPbbO7qUYV8oU6oa9/iuR0d+22WnVinh6MwcSj7Rg+0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a87b404-021d-4722-0410-08de554cbabf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:15:17.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncY3/vOa/ezShNDsra2bqUeeUBJtRnuSbwB9VKFfDniZ1YPON1x+GFX5ONivQuE9iUYUkitZqT2dJlRrFOXozHQgYGTiRGvkHkznp3W58fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7235
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160168
X-Proofpoint-ORIG-GUID: avv6-KTEvxy480gxxDEq--PDpM6rYVvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2OCBTYWx0ZWRfX8LGkvwT/4HMN
 qBJu9rGNntEtcO22ABXyoJlmDt0UzwAxYbCFKCNc6+Zs9DbcwsEE1YYNvKu0SPnZJrFMZqz3wxw
 6/sw9zvjhZ2tX7jJd80OQjfw1DEq3n99PT/qzFOXkrqo7ApgHjGluRpoivlIK93WPUQp5A4oBBm
 q5Li4zyB7TATdgkFNuyMonDD9NT+rcOU6cUvtkIjPMdnic8XzvSYNPfRsVh5VqyTyvIZ2NDyEpx
 Ig/c8vPEkiThB4HWdBFmwfeSRQRcZ8JKcQi36Fc8XKeyTecehfwCQl/+nF1lokoH8BDE5NLucJh
 JMhERF/0Lz7Pn/LgbrL/igpgT29m6vZX/qxUWobshScqOlFIjLsB4Yg0dR+9HziXjak3O+/Plkj
 JtgR8u/DWYOLsqO5DekNhDjGa8p4Nl6odq6kMx3KhYYQoeZ2B/uNuU8zVeVqoXQvO2lh1XRNc3i
 CZy1+AgG9MjHrEbb51A==
X-Authority-Analysis: v=2.4 cv=Uodu9uwB c=1 sm=1 tr=0 ts=696ab879 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=ElYP1HSbmEuMwrEg3VsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: avv6-KTEvxy480gxxDEq--PDpM6rYVvi

On Fri, Jan 16, 2026 at 01:55:29PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Earlier patches have slowly replaced constructs like:
>     int len;
>     len = snprintf(NULL, 0, format, args) + 1;
>     buf = malloc(len);
>     snprintf(buf, len, format, args);
> with the more compact:
>     asprintf(&buf, format, args);
> 
> Replace the remaining instances of the bulkier construct.
> 
> Note that dt_conf_init() continues to compute a buffer length and
> allocate a buffer, since that buffer will be reused multiple times.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_link.c        | 17 +++++++----------
>  libdtrace/dt_probe.c       | 11 +++--------
>  libdtrace/dt_prov_dtrace.c | 12 +++---------
>  3 files changed, 13 insertions(+), 27 deletions(-)
> 
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index c9e0ea5fe..ffa16d9a4 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -416,7 +416,6 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  	char drti[PATH_MAX], symvers[PATH_MAX];
>  	int fd, i, cur;
>  	char *cmd;
> -	size_t len;
>  	int ret = 0, status = 0;
>  
>  	/*
> @@ -426,6 +425,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  	 */
>  	if (pgp == NULL) {
>  		const char *fmt = "%s -o %s -r";
> +		size_t len;
>  
>  		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, file) + 1;
>  
> @@ -521,15 +521,12 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  		}
>  		snprintf(symvers, sizeof (symvers), "%s/drti/drti-vers", libdir->dir_path);
>  
> -		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, emu, file,
> -			       symvers, fd, drti) + 1;
> +		asprintf(&cmd, fmt, dtp->dt_ld_path, emu, file, symvers, fd,
> +			 drti);
> +		status = system(cmd);
> +		free(cmd);
>  
> -		cmd = alloca(len);
> -
> -		(void) snprintf(cmd, len, fmt, dtp->dt_ld_path, emu, file,
> -				symvers, fd, drti);
> -
> -		if ((status = system(cmd)) == -1) {
> +		if (status == -1) {
>  			ret = dt_link_error(dtp, NULL, -1,
>  			    "failed to run %s: %s", dtp->dt_ld_path,
>  			    strerror(errno));
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 65316f515..86353893f 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -475,15 +475,9 @@ dt_probe_tag(dt_probe_t *prp, uint_t argn, dt_node_t *dnp)
>  {
>  	dtrace_hdl_t *dtp = prp->prov->pv_hdl;
>  	dtrace_typeinfo_t dtt;
> -	size_t len;
>  	char *tag;
>  
> -	len = snprintf(NULL, 0, "__dtrace_%s___%s_arg%u",
> -	    prp->prov->desc.dtvd_name, prp->pr_name, argn);
> -
> -	tag = alloca(len + 1);
> -
> -	snprintf(tag, len + 1, "__dtrace_%s___%s_arg%u",
> +	asprintf(&tag, "__dtrace_%s___%s_arg%u",
>  	    prp->prov->desc.dtvd_name, prp->pr_name, argn);

This one should not be replaced, because if the ctf_add_typedef fails, 'tag'
will never be freed and thus becomes a memory leak.  Granted, in that case
dtrace will end with an error message anyway, but still, it is a bit sloppy.

This is why the original code here is using an alloca()... that goes away at
the end of the function scope.

>  
>  	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_DDEFS, tag, &dtt) != 0) {
> @@ -498,6 +492,7 @@ dt_probe_tag(dt_probe_t *prp, uint_t argn, dt_node_t *dnp)
>  			    tag, ctf_errmsg(ctf_errno(dtt.dtt_ctfp)));
>  		}
>  	}
> +	free(tag);
>  
>  	memset(dnp, 0, sizeof(dt_node_t));
>  	dnp->dn_kind = DT_NODE_TYPE;
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 102afd84e..d417a864b 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -232,7 +232,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		char	*spec;
>  		char	*fn;
>  		FILE	*f;
> -		size_t	len;
>  		int	fd, rc = -1;
>  
>  		/* get a uprobe specification for this probe */
> @@ -252,16 +251,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* open format file */
> -		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
> -			       EVENTSFS, PROBE_DATA) + 1;
> -		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		if (asprintf(&fn, "%s" PROBE_FMT "/format", EVENTSFS,
> +			     PROBE_DATA) < 0)
>  			return -ENOENT;
> -
> -		snprintf(fn, len, "%s" PROBE_FMT "/format",
> -			 EVENTSFS, PROBE_DATA);
>  		f = fopen(fn, "r");
> -		dt_free(dtp, fn);
> +		free(fn);
>  		if (f == NULL)
>  			return -ENOENT;
>  
> -- 
> 2.47.3
> 
