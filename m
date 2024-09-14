Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA6A1D015E
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726331581; cv=fail; b=SSkvMudY3ZeT8INseCw6s0qF/zFWhUs3NbyRGOogWauOywpRa0v5ka2nuSXd2ORn7sRaAB6T/hw0O38lHcy8YuWHHvQb7YaF2akbgnu8sqwACQU8qrXZ21T9F8BJcmcQkv1D/j8i5kXRWqwUpPY31ILfjC5O9zdKqIZBqXVClsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726331581; c=relaxed/simple;
	bh=2TGjkVRp+QeMaG1M5xzIRp6zezFBGTeuyeTgm+wgs/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GwAgjJSLOPTAkzVF2YGTUs3KgmMokyzvxM0ltPcDCXszsJEio4CM7FfYvTsCgOwqUkpvOrPSMN9j4g5OOqK6NJRXM5jPJzDVRDhstV4ISL5Bb8y9TnY6Bf/krDKGmxZEZhReSdRdkq+e8bd1cUrjv/3kR1otzSSaEqLKQ4GV2m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M/OAnEJa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yQ729D+n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M/OAnEJa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yQ729D+n"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABbKq002134
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=mBa159gwh7a0Uzp
	XEiW25y6LUXTtlBiHeLU4WYmJyGk=; b=M/OAnEJasBfnk9DDqXlQ7HVasvq84cf
	EzxnHCPyBoV86sYMGhh9/Eu8H96OuzFkazIeKEnPog2mVHPsgO7NG+i1uBv92rij
	WZFm9yHFEJIA7QylJy3+Bths8iidcXXDmv1wrzW+4CUJ5ZElroUSx6i9mYGtax6j
	XEhhQ45DzUzBtfr1E8NZnx5p6eWN+n7h6lxWw+flOGOJVeC219XnqlS3ulY/mR+a
	rnpwp9lexBzMy+DdS5TL/yFqb6nvbX/PH80cRsraZmHDT73ANXliDgoWUcIGA22C
	wY+kHYzoJhRCt4fDKwWNCFnJfDyHQ2Hs04sn0RasHcaLyRMuFzfqj2A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3scrknx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:32:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEou8J012854
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:32:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6mhkg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAlFYRIkdIgeAxXOuwrz9EPTi1FPlWax3ZHnG7HuRlQZDF0Lq6RAvCu132o6jE4fJHWw6oqGN7yuL1kaQsLPzfkzzYX6GFLPA6QzQSBuPfpCfk4nP6RBat8LlTbiwYjCHhbf1SvJ6U3Sdm1dGAsYhW0fMZpC5fmom+n5K2W85vhT8U7Wrp8RqbniwvNhqb5ZZdP/LLOwvYtTYP1JB81EVdZ2xH/r/CQeKszWuI+DJi7KyMlVrLxHnsmpwUTZg0cr8mG5IWgZl5TtQCEINlsVIMUTWBkQ9TWahAqW/RLCBeWtEvUXa5gqQz4JpAabhpKJV7nFQhhhMpKgucsY3j08EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBa159gwh7a0UzpXEiW25y6LUXTtlBiHeLU4WYmJyGk=;
 b=aokoXmmCgbjFu0arSwAQosK6SyOZno7A//etFx5sYOfW9wFvE0zz6o+stPuo6RJzrW/tfrTUFfLWN6kPXCWRtLOLdOmELbTk1e1WrIjXO17egXigdQCo87CD2Qa4ykXfQhaceEbB0Z0EbpBby/nNeVacG2+/VTtAJqsBbh6czxdTTb8w7Vi3xGT/4UWMCkj558ixMjBIi4lgHxLFgV9NLVK9uhn1oOjJJsCHi4SE01V/RzqOcTxm/XuwEtoiKtuRvMsVVu4LZiMwHnl8AtI7tTtG+0zsjR0W56jH6RJKGp+U88lLSlvmylV/YFzE4NigRWTrJaSw2D9zSWVPZk2I9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBa159gwh7a0UzpXEiW25y6LUXTtlBiHeLU4WYmJyGk=;
 b=yQ729D+n8t63sRIiSugrM1b1dVEGRHTXx9xoLrRwmaejQHa90/G0un1+VPOLXs169xAAocxSahZZC64H3a2G170/sjRYr8CusQsL9MIbTEOUC9rYXyFNCp45NFYFeRNdZ3c6fY0qZP9dGQb/FPiFqBCYCxU54PcURyKVOa7iVZg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4798.namprd10.prod.outlook.com (2603:10b6:a03:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 16:32:53 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 16:32:53 +0000
Date: Sat, 14 Sep 2024 12:32:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 10/22] Simplify dtrace_stmt_create() attr
 init
Message-ID: <ZuW6sov45DyFF4Pe@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-10-eugene.loh@oracle.com>
 <ZuW5FYlled3rjac3@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuW5FYlled3rjac3@oracle.com>
X-ClientProxiedBy: MN2PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:208:239::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: dae72bf3-8469-4747-65dc-08dcd4dae1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KwKwy+O1YNjXdkvDXKShetAIIy66ilPGIutej/aHL+EFZjsiRyx3ZjJVG2ry?=
 =?us-ascii?Q?6jfe0Uu1439evM+FPrGsXpgswmCXKIyrjfRelfHmIH+3mA+a6ZvAxoa6Bu89?=
 =?us-ascii?Q?TphZHQkDYS3RerV5x2Ma1kWWeq2volTWjOSkodHWhErD9ygLUt3KMq51ShmL?=
 =?us-ascii?Q?tPuHFowGLthvPl25ho/U/zS6yXvGdw1OdvIEkADSh384HQ1cpszV2AA8WyqT?=
 =?us-ascii?Q?BqI2ahhqwv748c6YCRq8RhMyp1KKgAs6yvgLpRCpRR+WnKF82kVW7cn6s+DA?=
 =?us-ascii?Q?JFMtoAC9/1R6i6RZDfGjf81Ug30XT9wVcUX6s5WVqvTCtIaMDSYE0NVRG2uG?=
 =?us-ascii?Q?/mlDVUHBOJfjgArBjacEnzmYkcEmXWZEl2CTpjU9lwP1SShB5u+H+LdCPh8o?=
 =?us-ascii?Q?N4yPEiGYLid89gbBr6v0OkJXBCAd1ZhT25i2dGHdr55XlJ4tOtnbScUt42tE?=
 =?us-ascii?Q?u7FVGt672ZJFczU+Ha4RMWcfJ14CV/llh94F/rZtUfBQie5Ui67ZTZMHisNS?=
 =?us-ascii?Q?/tu3F7M7ekjk2uf5f9CusiTkb9UCQErqF/p+Qf7K47IGZ7paw7nmUEOU7wrB?=
 =?us-ascii?Q?J360xoUtq6zu5zLsVk+Sl7zru0CUhFf8eICrNSHp8ajUIUcpJpmDwPQL+Yxv?=
 =?us-ascii?Q?CHZyyywI+6CKz/uiuqUUI45ypTQ8GZKQPM2dQzKacZebwoLtOCV+ftbFTe0d?=
 =?us-ascii?Q?MIAToD8ovgsZ+hl2TNE3UXDFADlqblC+KpnZ9Oel/y9MkbsaAgZNUs7bNQ1B?=
 =?us-ascii?Q?XFAhdBgVurtNTTzUIppQg2g8kLFC6HoizLTJ2aW4X4VJfv/ZZ660S8CWNF7a?=
 =?us-ascii?Q?2svWaKZhC1AqQatcRMXZNqXeKaGGy2yD17ghCgfglMgLAh2+9YLrCEulzuma?=
 =?us-ascii?Q?D6KorwQlzGHEcbfQpHWg5Sm5YP2iglFou9AcFCzPy+KBHpc9nqY6b3e/9sD8?=
 =?us-ascii?Q?/73S9MP1m1YLgvtax42+h8PTFNNSoPUbt7oG8S+HiajOnUDzIrv1aVYGOB97?=
 =?us-ascii?Q?DuKQ1yw8hNcywemwJ3BxsX9rWLCWoy7A+kMlYcTmeFxKNOc61FSbeAp9d6uv?=
 =?us-ascii?Q?gjEJp2aQup+u5TxwpGQ0m8HSPw4Uby5thgtYOuqO+ti7+SHA0Qi+nSNGo4kg?=
 =?us-ascii?Q?uSC/V0MUO7jwk6wDLcI2MWk79zLjqe6dektT6T9l5jd6hmtloSQ2Gbq8FlsZ?=
 =?us-ascii?Q?2C0As7qgzQD5rHjjLbFHYMiEsFP69WLTdMPwXa/utty8QU72lvs+Y5YHZXyI?=
 =?us-ascii?Q?lmel4uBM8DDszxzczLobmDYb0XKw9WRJTUmy2cBRBL7kHWh0U0qep0IZZa0E?=
 =?us-ascii?Q?YgH3gEbAkln3C5kY5ipym/AjdXJJk++RT7ddfKwhZv/cKYX7Y/yoPv+tHQnt?=
 =?us-ascii?Q?LYOCLr4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBP27OfOSgbMrNDlF1RYimYsoxOmu1DxWoQWJXwu22LYmPEDikI1UTTAtr0i?=
 =?us-ascii?Q?zay89kICkfS6AqZOdnsE7XQGluAFNMaq78YC5W1l2DdeR+rKLcOJb/MQrOiI?=
 =?us-ascii?Q?85HHbCn9X0ySztfPaIVatM37tF4T5LLI9ujZA1U1n/Qzusr1/peqSv5QGPDG?=
 =?us-ascii?Q?HTgkR63FXgDfE2d4IY1nta6PKCZHwGzwsbp9h3OV2M+niS94MQv0+YlNK+fc?=
 =?us-ascii?Q?J//n2+YNtBEbzFVmRqgEX2gpjvBUweWJCWM96/TYYI3+pejmE3VrVA3pxKaL?=
 =?us-ascii?Q?LSfP1WC2rEAaAyBFcdF8JX48K12d4b+mVN8aRF3jlLD5E/O/161JKGm4yLoK?=
 =?us-ascii?Q?jIA1XOyG/cc52OjTO36qqhkPG+5LOAXoS27Olu6q9EfTQ+T/5s3Buo4BEnsz?=
 =?us-ascii?Q?Cayfa6hLtUtV1WNzZgpFCVIy8cO3FMkCCfQrXaOx4wL9kySC9Gr13n5Nvmuk?=
 =?us-ascii?Q?hFZ+v6VevQSIQhDTlXn/XoS1o2wcrHEIscrEdQ1WueNryUoxfa3HynvRoP/p?=
 =?us-ascii?Q?csEYuP76lJdK9z06S+JNBcV7SwAB9ArlzlryaIg3RSUUF7eO+WquXe2bp8z6?=
 =?us-ascii?Q?G/fSoHF2XqTtukLAmHd+ga4CKGDNrzF5yCc7sGI7rZI2aiLRf6ez0S69KXRL?=
 =?us-ascii?Q?+stI8YaeWD6VtR3NHhOniM5+SdbE9Za0J0fAhMQ4VF8XK71WHUsXHH60fuW9?=
 =?us-ascii?Q?Solb2C1bW+KLGdKw8xvdQqCd/mJMumIzCW7iT6bL3aBOIJJnH1ruygCD1Vwn?=
 =?us-ascii?Q?fI+j3gGAIqUH+ZzEVKF5C3s/2LABBKFD92lo2W5qrGD8FcJmaT6wDJuKa4EW?=
 =?us-ascii?Q?op0vvMSVIrttq/y+dXO8fwRHaKaB601SEsh3ppc+JoalraUVLYCHCH4Xek1z?=
 =?us-ascii?Q?47xHxrXf8vWEcQ+V33xd1w94Psr7DylRn2YfO1FQgxQYuowOF+P2mmzBatWR?=
 =?us-ascii?Q?3F2+tcyd64C4XV3buGCofJxduuPgcNExVWL47uqbMUY+ci22qGr3GZZmvJ/6?=
 =?us-ascii?Q?jmk1UcA5mS2Q+vZLrkwWVTSB5/n8xS+NaWv2YnTI23nXQqnE3hiY/WZEY6Zj?=
 =?us-ascii?Q?o0e2HRF+zdOuNR7kYjLg8k/tQIn6Ac/R8sNGReB/U2kPg7gNsZpcozk9OkBF?=
 =?us-ascii?Q?MePqsgDwC2lHQpqhfo1w2ZJmDvdgz/+ow+30rRYPxp68euY1jM/xPHGYQxSB?=
 =?us-ascii?Q?1e1RS5e+4dyOpW9fo3rAN2uwJz1Y0in/OX+NXVMCSsJFMVlZ9XEtIjdIZwEQ?=
 =?us-ascii?Q?8GWllkA/1uIL4Nu0u6cUXG4hJfO6tSI6r2qwSq/kaVGldFnO9v7UeL7LCPWr?=
 =?us-ascii?Q?C5qGchF3gRTrqh70elK1IaD2X07EEclrZ5S8a8X7AZiztRZLFH+XvM/1rI/P?=
 =?us-ascii?Q?4KeE1sUDqafsXcUhcZ+rq5VpOXOEz/oSes9C3E0LLthadIC0pthXipEa6e1K?=
 =?us-ascii?Q?0iCPpH35HbGF0QhPTuWyHUp5ADVCiCCI57QFR7DLsMVE4jOSGWKQKOYjELRe?=
 =?us-ascii?Q?2I2mghArEaRfuSrrMWC3fyHg6HZ9e/W38npWmUXf46rdmtoFGfxqbb/lTrua?=
 =?us-ascii?Q?pTChkhnXPqn9ijMTsfCgBrYF7N8V2rPBa2R/6luyNCprvykkYQgsTcHsJp2X?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/+YU0tCQIiVpPKP4udj5Ri2y5YkhPWdrOZXO0nxk9/X5QOwBpTRFG371G6ey33JGWiKlpaeqiBiH4kXx5duGwi/E+1rU68m+4e1mOAlkvSrs++D7bUxlc4qabAPkgOpGLld6FWSUyXAvUeuMu2PeJiO0PDVRxWkxW5U2/L5mbWIWYXr8mVzoQ51dmmwLdgwr3y+kLtS07mkuXH/TjFLAn1MT74jP3CbgsOspenOocGV6aJi3Y1QtmMWiDl31QIwYTx/QLTMNlV/Cz3hXITc7HuFh8EHun3auoUj1Ccp7JaYTJ+DAE8QhKgsFHh1U/5mfXr0tGrVGAuOwTCcwSAlSCZzwCmMUBOxS64FwYcqAkWsYfZvRZhuwfso7lGUupuhT+eKkXi3jeDt0wvmY7OFGJ7uvHNt2wS8UbOBW1uVO8B5SoZexl5xRXKzKF8KHibG8f5pNJ+rOzBAvnEb8TSljVoPpPr2iuUGl1eiGA84HFa1sUc3eUKrC+7lxr9p1ie13sVmCwz604Y9z7g5If7pxrcvkevEeEsznPdNCBaIt5SZtI9RcKPJTLKpeSooKRYqMdF3akkNmGck8ACBB/Bg9/mL7SBSD4c+/TT+8gmrRzX8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae72bf3-8469-4747-65dc-08dcd4dae1df
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 16:32:53.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3uqsoKxhOhdimV4P4bty3e8uKna1KdCtPjWuvkLWam7NZX5NraS/9ObQDgZfLYYlMawXFf7sWUiLo8jzVTUY8VMYJoLjP6p2Vj+V4W4bLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140116
X-Proofpoint-ORIG-GUID: CAkMuj80u7kyZcKR_M8iZTOQ2gS76z85
X-Proofpoint-GUID: CAkMuj80u7kyZcKR_M8iZTOQ2gS76z85

I adjusted the patch, and changed the commit message to be:

    Simplify dt_stmt_create() attr init
    
    Even though dt_stmt_create() initializes dtsd_descattr and dtsd_stmtattr,
    there is no point to doing so.  It calls dtrace_stmt_create(), which also
    sets these members.

and added my R-b.

On Sat, Sep 14, 2024 at 12:25:57PM -0400, Kris Van Hees via DTrace-devel wrote:
> On Thu, Aug 29, 2024 at 01:22:07AM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Even though dtrace_stmt_create() initializes dtsd_descattr and
> > dtsd_stmtattr, there is no point to doing so.  Its only caller
> > is dt_stmt_create(), which itself sets these members.
> 
> No, it is the other way around...  It should be done in dtrace_stmt_create()
> and thus it is no longer needed in dt_stmt_create().  As dtrace_stmt_create()
> is a libdtrace API function, it can be called from other code, and since it
> is the function that actual creates the statement and initializes some of its
> members, it is the logical place to retain setting the attr fields.
> 
> So, instead remove the assignments from dt_stmt_create().
> 
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_program.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> > index a4b052fc..bdb434e0 100644
> > --- a/libdtrace/dt_program.c
> > +++ b/libdtrace/dt_program.c
> > @@ -240,8 +240,6 @@ dtrace_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp)
> >  
> >  	dt_ecbdesc_hold(edp);
> >  	sdp->dtsd_ecbdesc = edp;
> > -	sdp->dtsd_descattr = _dtrace_defattr;
> > -	sdp->dtsd_stmtattr = _dtrace_defattr;
> >  
> >  	return sdp;
> >  }
> > -- 
> > 2.43.5
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
