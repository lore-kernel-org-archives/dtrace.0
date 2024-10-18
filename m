Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6F1D7E5C
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266107; cv=fail; b=FAjv2UkBpQlBR1hXD/fFS1v4dXZHy0rGEQFiaDUVD4lxnoRA1XR3as8S9iYYut04sR63JQQyi/Ayuyo0rZG5G2SiDAPwsxrrhpnJkffbRXLyU5Pcx60SbXGdYB0e/PPJQVhTy9RAXQjuR95XLfLR4InvnsWHJh1Eaer0S+KHjdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266107; c=relaxed/simple;
	bh=fw7OUjJfi3OYvqSzLE9iuUPEMd17TkCQ39GK/cmYhgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A+1QEPsmgInSqLlFipua/F2iw0Qrr5uFiOhjY2MmR9qrOkNNbrUTMirOJwIHEzhyFw529WN5YoEN4PXXKXEOSbyauJaEQlkn1W665ptEHMrrs4QfsymlX5ql1i18KPxaDgmAovljNhIN7Koo0/xJZhgY0C3R3lpZPiWqnbVn89w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C8Tl8+Ui; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lRpQK9Xm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C8Tl8+Ui";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lRpQK9Xm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEBgXj005833
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 15:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1zQbCSpWfnsR9NKuFX
	0uLNyzi2vQ29mDZnuJRC4/iyk=; b=C8Tl8+Uia2eKfVHvYit43P1h2mOA3S28Jq
	dcewwKFJfKftRcAqp25t1cQQas4C/4BvdXqpCmG7Dnf3TadfUSt0gd1CrUxarNnx
	YDAfEOfVr83778HTreMlkBhMcBO9bR5dh1WnQXmw+fAYpUnJrjGFQ6b3kYa2Y8B6
	xmi+RPdpvqhgtog5zXO+B0E8g71zz7JhpxODnaDZFJF15GqVtRRC1GVXFDU180gp
	CewsWfaLQGfRvU59vRi4QZu2jCbOXf4I2Ss5Bad6QGBff1mIPMUcx90JBAHfwcmS
	471s7rtH6mwGTO+x+SzKFlJsDnwMXhfcvu6yg0jIktfIwnpbpKLQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gq7s56q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 15:41:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IE9hZm027120
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 15:41:43 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjc20g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 15:41:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elq6nsrB4cieo26XQ+Bfp9uzOm6otp8f5dnCXqMuf0Cw/lhr7lM9VwXukdGCmBG2DLngBukEr+jXkDnXxr3/hZU3PzShC0aslSih++AO23GYZratZsAoZZXdNDTeEnF7+BUYDt1T/h1JHAlCd3lAeS1AIHkgaRUr4sq6ggI1AjkUamfXXGUzTYtp+YY5SjAnyy05aRMEkqj5Wagdfp9t0kwRqUC4/X7dTHKQIPsEMBVJ4LDdySxM1b8GmldXuWQaliq+QGjQbFS4Lv3rglt3ex62XC1VsVMl6Df5V0lHSuRbslJjNrIToLKdMvELe9wYtYYgY5gnINka0fnAaBrk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zQbCSpWfnsR9NKuFX0uLNyzi2vQ29mDZnuJRC4/iyk=;
 b=tdMSlZW/FrvrjHtLo56vQi6XSwzKZCXULOUiWMFicHFrLaOg6KbKTbybVBpaaO016jvctyaNOfLNb3Q3P0q8aOgNL2ss7BGIoEzYqnheVsZqLWic+8y3hoaljmvOrrvXGZC9k0BqnQeM9CKVQn7ZUwf1DYpvCGs+pCFNb20YtVAU3mK1LcpPULrVnri32ttWStM+ltrMaVarECdR4WGNzzay5ZTNp41i11rDv9sFe+HlYAbRC8ILS4H0ZfRrspn094jmyppXjeY/yDkxIFHLmO48GPnmuJxJ3eeHvGqjdhDnTQH/qbhzsKALcYbn/DjVFn+FwzUpPwXRmGvh0vDuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zQbCSpWfnsR9NKuFX0uLNyzi2vQ29mDZnuJRC4/iyk=;
 b=lRpQK9Xmaqmk+9YskJvIf06W2rF6funxUQEFAHHwyIBDmva3oFH3EMrnFDSfDI12wEX2p5YDbMq9M05ISD2TdRNFkIHTHVkCKWUQ9mmBrnhfAJC0r/JqngYmxjY4VkxpcjAMzYANAHKBcMiZolntveOMx/vC3uqDU6cuwQ9nalQ=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BY5PR10MB4292.namprd10.prod.outlook.com (2603:10b6:a03:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 15:41:40 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 15:41:40 +0000
Date: Fri, 18 Oct 2024 11:41:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 dtrace 0/4] kprobe support for .isra.0, sched fix
Message-ID: <ZxKBrsZZH0hV6cdD@kvh-deb-bpf.us.oracle.com>
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016155409.4038017-1-alan.maguire@oracle.com>
X-ClientProxiedBy: BN9PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:408:f5::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BY5PR10MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: 370b4c02-05b7-4042-9903-08dcef8b5c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2iPiQ0Caqp78QubWR0rF1XpKYnMBylIIfq+eMGhcchuIGPvheqTvjwbsofGa?=
 =?us-ascii?Q?e+kQ6HWenXDzoel0DseqkEUfBlYJTOoMd38Ap9Jhj8auM14cdFNveK59POD5?=
 =?us-ascii?Q?qS3gZ2M1c48L+qsBSci6TfFkuvjym3Bgd5iVGZ5nZSowbQPhG08CNzzh/SNj?=
 =?us-ascii?Q?tEsiTXKtaTkz+gVXFHD35jqX5Egd1Jw1cr4SRNgbo7Lf9CWCNttoVOJa6xtm?=
 =?us-ascii?Q?H8/eHEWS05K4Nzz+Cgz/OfJpjG7e0eFZrNtC/x2a4ZbsEN2Dxhl9Wm0Dlydz?=
 =?us-ascii?Q?iE2X0xatp8l7AUR3obGYpgaEIHwEUK08yg9S/gxkLpQdAr9/M86PGZY9pyK1?=
 =?us-ascii?Q?XWWw1ZlmrmREinpAAf3KariasdHy7dI+ZaCoeFoCiy58WIwdeickbUd65S1E?=
 =?us-ascii?Q?yOkrdMktmI5bqDRp/dI70WU4Yyk0/K1YuJ/NGp+PTz6aqyS09xkBSAxsxFIW?=
 =?us-ascii?Q?KS6G2Qo+D6hKVk1+fnkGN9eJ9VyjVxVVA7v2/dZtJXtyP+4TFNSUiEBbVpFX?=
 =?us-ascii?Q?fIhRZF9tOKaO3byqCy0sNTOJgeALBdLidwXMUFWhWq/U8AxfK5GCXB1yTWJl?=
 =?us-ascii?Q?ylI2JAZUsAlouIE98SaQlE1O1DSrSjNPv53yp0NQKWyWM7Tzsb+/NGNSKjxm?=
 =?us-ascii?Q?jTMOZtvaYhP50wotP45Qpxob5zl+dtr4n6ZUHGlAJqp4tV24v8xY6wOi1aLN?=
 =?us-ascii?Q?W9jajzyEePnDJHTvQzsI1JPEfz/HVVSbDgGH0uDeho9lYgmUUmkLvR61J1og?=
 =?us-ascii?Q?VwGx5INWrTsBhBCRV1jNgen1x38j+TTUIBd2pEfpG6ksHkxMF2QfYMkt3/7J?=
 =?us-ascii?Q?+S/J7cvLvb43k0J1nsG3k9c8XENUXX1+isBDmDK0oYdHNBWDbFOvufdoGuFv?=
 =?us-ascii?Q?+u1Xf+HALdFMJ9eAHJdEAuh8TBF8XTj6kGikWEUeiQVs4yEyIGWFwYM1AplW?=
 =?us-ascii?Q?tkJTlN+rNhqRRx9236Sy8l0J/cwY7C9mV1A1MVFf4WuZzqaPYmucAjr5wxTh?=
 =?us-ascii?Q?gTG98E/I8RFCyK+O99cnXdTmoUzWNFNgAlMv+Run8JUxZEFq0KePRp50VQ2v?=
 =?us-ascii?Q?vbhToYTPu6+JHJ7tP/dHBP8MndP5LLzMkAdbbpOeq0XxGgY0z3eFGYFqcQpp?=
 =?us-ascii?Q?oDV2cPuKeswsFW0MQDu/7XEuwSdo2VnQZbk/G8mQZrBTaSpr1qqtYQKLuPLg?=
 =?us-ascii?Q?zUOgxPOGj5cyOBM9lIvyXF5OiMq3s5yQbTOeQmxQkPeh4b99kGmmwzWTGpun?=
 =?us-ascii?Q?4vUsM+Zrpq5Dmp2O0s9yVhA+nHLvyfUu6bKWjOMEpPqqzs00WYhTjQqtz2rB?=
 =?us-ascii?Q?DNh1QKJtmHLDXQ+F95JsiCiv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ioDAfATG4gfokb3hrPltLaYicGDPeEytB7q9nLdCR/4JZWPhhFhEqz0HWnKO?=
 =?us-ascii?Q?UKIVvXcCrztwxDrYlzyn+o+UGLfCC5514scecYOgY0/nM0pXQpY5g5dSGZWR?=
 =?us-ascii?Q?bIJMGCeAFMMbe56LZW05KA/nv6nINh0b0snfBRiJiZTdBOiSlnmqqv9CxQuB?=
 =?us-ascii?Q?+ZJd6gKC1Z39Vyd88VODBnNg2yc6hdotrxPym5MacLOe15yq2XmaYI7hlg5O?=
 =?us-ascii?Q?7CE2hd64lI5hYmN9mmXLsAinXMza0vZMppS67STLCGN7NjJR0JjrDs4Sbd8S?=
 =?us-ascii?Q?vpaxrPYxSLmAxjnuCjEHWyivI4fbrT2vw7OGRLLMbWwEqu+ACDvUEzo8Klps?=
 =?us-ascii?Q?Sk+tdjurlvDhuxWw5LoiO9JQhtbUPWLv2kx46noLZn4isfBKqzmx1zFub9Jf?=
 =?us-ascii?Q?d/UxSG9OYNW4it0HsdCbbjt7VHa8ADeErKxdyKuj5uc7WnBjjNbBp0HQO2ya?=
 =?us-ascii?Q?YYLdf1+9dto9UznDWZQk6Y0eRJHG/PCwVLEQkSrB3wRNHY/JLYhyjkaRIlEr?=
 =?us-ascii?Q?akuWwR0mgJyoFNL8J4vMeoiu4gXFuOh92Qa64CSFxU7BVLcR9Tw+lOYlUrgx?=
 =?us-ascii?Q?Lbbp3r67a3igdWLah7pAAysIlvgTgBi3kA9jedHARoIzNmGgroF/J2o4A8sh?=
 =?us-ascii?Q?6J2jBCZFf7GijKTMyGAEK6XC/19mPEjh1UjZD3JWlFqFxgUa5rkgISM2IGFY?=
 =?us-ascii?Q?9aKhTZJtMer3bRjuAGU4rhTj1Lbsd8ehDW5GK1pkVtKFhju16Yoi7mSwJ3XH?=
 =?us-ascii?Q?SqvT53RVxR+LfnE3Z8xN1QlQaSfETKNFG32wX+0QPvgnwFqceEIr8t2L3jAc?=
 =?us-ascii?Q?WB4WrwCawFCnSDQuOqOeFHdDDTZXBSmZ9nmsOtVKJtzVLz90J9nmLZFeW1Pt?=
 =?us-ascii?Q?WK+eL+q6rO475IFaJsdiHoaj73sigWuUusISoNVWHjTNpdvwoCCoZ7fEjEVr?=
 =?us-ascii?Q?V53iqcvaMsHuo01qTkJ9t9QzRbdJnR9bCDsBoB6upnsiBTLls3g9xViDZRmx?=
 =?us-ascii?Q?j/Kxk4hVB9m5uwO4+Nr6b5Ad72bgTLDAqD+9UrTFoHemdgD+HvhMhUQe2D3M?=
 =?us-ascii?Q?df2czxg1WSrysWMrYmugTVc+72z8JD9YAeT7vKmQiZHl2D8H/rrYW1ySZEmN?=
 =?us-ascii?Q?C1zisvZRf5I68/iwxbSbo9Gy4aucu9plh4+9AzuuXyb30vc9DNp1Y7ytK1cW?=
 =?us-ascii?Q?ZUclqc/N3j/uR2IL2RruYPF7csYIRA5A1dVK9g5IveIxZpem3U7NYKXAP1av?=
 =?us-ascii?Q?QD4fWXdSeFivYlAf5Pk0g08oVyh65DOTZqSioOuEX5EMsQBFF3cHT0tsgCOF?=
 =?us-ascii?Q?EMySpYsR7FNwg1NtZi2Hmige1uDmrHiFggOf3dGdxbKstobOtQqa6yEAZy/y?=
 =?us-ascii?Q?ae6u0n/4dj96PrmRb9ChFdqKPAED9beQg0pPCVlbfAUVZaVBLvmmVDZH4YUj?=
 =?us-ascii?Q?LgZn9nt56UKgWiAgWel+UzS7AtAjVnuXevMngIbIl/CeJ9WLNqXQOt45G4B5?=
 =?us-ascii?Q?pKRU80+m8FEydCBcxLgHiKTDmy5q2ZhxIBchuBosxMPD2Mu0lYLkB2IR/K+n?=
 =?us-ascii?Q?iAvzNjQ5R91lBqyEZRfgmuxK52VeMWAq45o1F+bzDgQgazcagDcU8qevBO2D?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	53/6PvRoT+jrv4fZ5PnOwC9AIAP4D8YQjOgnbR6wi7JmwTc3PNz152eBtz671BbZmPI/d9v0qs/b5xDKpa2l9n8TA2Sp0fOdqZEltPn2iMPwZZqedssR4w0Ye2e/IWxA/PMV5A+sff4mxXuhaVvrOmS8B7Q5ykNa4H+OBX+3O0DRnurwe87ZU2hnYPHF7Dw3rZ4dXEhwDyvC7cPF7T1G0QbVJGad8cPvy/0yxORFTGnWYq6xKrrjChJUD7Mkxjb5+Al5/xARAKdMtiA9HVJq+CZYNFCQQUIVgXmHes/J3Fu2FlnycJAliyf+3tAkr2ScAeo4Jgb/OQtxarzqj027ZcAROD0mNqj04J7e4R6wlmEU3UU1KJDeZ8IRmZdT7ThcTG17H9YA93amLfoqAiqvvSKiHPV2KwEPpN7koxX2ujSJoArTVGJTvdegRz+8SvqnEJYo9hZ4XFkOm/o+AIrH5o7BlFjGDAXEp/qdC9QdGWKeAuaCE9lTAUtCm0ST1MLpRGMrvCxJg9U9I4YOabsv5q0fuV9Oj10eLw39taFf/StTu51tx0MZHHLfdFL5y1IsfiRTH8gwRA4paJi4mjTPlyx+vmnUBxlQjNg7GoYFcis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370b4c02-05b7-4042-9903-08dcef8b5c0e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 15:41:40.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0fX7QJMcfjnc2VUlzZxSUO8Rfa8mV6HQR7Ux4d/yvrmwrmnkIKWKjlmPIt6Hw5GBgNjpiLadz65TtolASnwwz4m/LZ//IENlqo/ecCJO/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4292
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_11,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410180100
X-Proofpoint-ORIG-GUID: UriiFyq-3qWqp---JA1YtbuhowOq98-y
X-Proofpoint-GUID: UriiFyq-3qWqp---JA1YtbuhowOq98-y

Before I review further, I have a question...  Do we need to consider the
<func>.<suffix> symbols as separate probes from <func> (at a user level),
or can we group them together?  I am hoping that grouping them together
would be the preference if only because the suffix versions result from
compiler optimizations and it is therefore likely that a user would want to
be able to probe <func> and expect it to work even if the compiler decided
to do something under the covers that results in a suffix-variant to also
be created.

Kris

On Wed, Oct 16, 2024 at 04:54:05PM +0100, Alan Maguire wrote:
> This series is focused on solving a few issues with fprobe-based
> attachment which prevent us being able to attach to functions
> like finish_task_switch.isra.0.  Such functions are present in
> available_filter_functions, and represent real function boundaries
> (since they correspond to the mcount function boundary sites)
> but because they either lack BTF representations, or because
> those BTF representations are named without the .isra suffix, attach
> via fentry/fexit is currently impossible.  Falling back to the
> kprobe implementation is the best solution here.
> 
> However, for stability, it is best to represent the probes for
> these functions without the ".isra" suffix, so we need to store
> the full function name (with suffix) in the tracepoint data when
> the probe is populated.  Patch 1 supports this.
> 
> Patch 2 ensures that we use kprobe implementation for any "."-suffixed
> functions.  An additional fbt provider with kprobe implementation is
> created to support this (so as not to  disturb existing fprobes for other
> functions).  At kprobe attach we use the full function name stored
> as tp event data to carry out attach.
> 
> Next we need to ensure we do not end up with a mix of kprobes and
> fprobes.  Ideally we would do this in a more fine-grained manner, but
> for now just ensure we do not have an fprobe/kprobe mix program-wide.
> When fprobes are active, we will only use kprobes for "."-suffixed
> functions that are used, so in practice such mixes will be relatively
> rare.
> 
> As Kris pointed out [1] at compilation time, trampolines have not yet been
> set up, so we can replace the provider underlying fbt at that time.
> The probe_info() callbacks are used to check for a mix of kprobe and
> fprobe implementations; we check for multiple fbt providers which
> have a count of used probes > 0; if this occurs, switch the fbt provider
> using fprobe to use the kprobe implementation and reset any event
> ids associated with fprobes from the BTF id used in fprobes to 0.
> 
> Finally we can then use fbt::finish_task_switch:return as the
> dependent probe for sched:::on-cpu, as we now can probe it even
> if it becomes finish_task_switch.isra.0.
> 
> So to recap:
> 
> Patch 1 supports storing/freeing event data with tp events.
> Patch 2 allows tracing of "."-suffixed functions like
> finish_task_switch.isra.0 via a kprobe-backed fbt implementation.
> Patch 3 ensures we do not end up with a kprobe/fprobe mix.
> Patch 4 then uses the fact we can now trace "."-suffixed functions
> (with kprobe fallback) by using fbt:vmlinux:finish_task_switch:return
> as the kprobe dependent event for sched:::on-cpu  . This function is
> often optimized to become finish_task_switch.isra.0.
> 
> Tested on upstream, 5.15 and 5.4 kernels.
> 
> Changes since v2:
> 
> - probe function name exposed drops the suffix (Kris, patches 1, 2)
> - restrict kprobe use to "."-suffixed functions; this makes their use
>   less likely in the fprobe environment.  Do this instead of creating
>   a "fake" fprobe probe with kprobe backing (Kris, patch 2)
> - modify fallback logic to handle kprobe/fprobe mix (patch 3)
> - modify sched:::on-cpu to use fbt::finish_task_switch:return ; no
>   wildcard needed now that probe function name is unsuffixed.
> 
> Changes since v1:
> 
> - simplified approach by just swapping out probe impl when BTF lookup fails
>   (Kris, patch 2)
> 
> [1] https://lore.kernel.org/dtrace/20241009140236.883884-1-alan.maguire@oracle.com/
> 
> Alan Maguire (4):
>   dt_provider_tp: add optional event data, freed on tp free
>   fbt: support "."-suffixed functions for kprobes
>   fbt: avoid mix of kprobe, fprobe implementations for used probes
>   sched: fix on-cpu firing for kernels < 5.16
> 
>  libdtrace/dt_prov_fbt.c    | 138 ++++++++++++++++++++++++++++++++-----
>  libdtrace/dt_prov_sched.c  |  23 +------
>  libdtrace/dt_provider_tp.c |  27 ++++++++
>  libdtrace/dt_provider_tp.h |   8 +++
>  4 files changed, 158 insertions(+), 38 deletions(-)
> 
> -- 
> 2.43.5
> 
