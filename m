Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA9C2571BF
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753469754; cv=fail; b=SQG5RS6narw6mUnLlcdAPnSVWx2FlwBg5HhkWAyTtJn/8p9P3BhiS9ohwfjNVis+oLl0yXMBjrim2JIh6YfSRQMRZjWALINSGidH+V7MeEAgX3Egeh2gOtvhmvE36vY2zNa+1oJq0Y46k9GTaTrZYuoHweGHmypX6+ZWpJAFNKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753469754; c=relaxed/simple;
	bh=YYSfWUUNvWL24zmTsM4VbpkkzasD7GOVLnVkdiURgBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Iz1DacT8NrBeVuNqrvVVwlqoMmQR7djZWILOMW5jwrtmmfPXBak9PAcrMtaE0QvbV1Y6QvLp3F++2lnJ5SJChpnDiYUFh6VDy7knfJdKP90KyFO+P+GXvV7nHJvqk8WXV+Kz7I/qpj6RUojC2BDUPXRiwX7hk+89QuBF80Zo1TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jFVZkXQO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vHKmeAcn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jFVZkXQO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vHKmeAcn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGC9To011107
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KxnGHv/J8SFUwPBQX7
	7VfIBtNQp4a4nycrpddS6etuw=; b=jFVZkXQODzskI/1/HGKOlVPeNvS9ZPJ9se
	/brRFfSiopoW8c7eGJuBivEqb0l0UhKPSXOmQEQsNH3wcW39VEpOOGAQZT7dAP9m
	4zSJK8Y7fJX6Sy12aThpuCl1bSOwtrncEXNbrSSzxML5yDutgIY/We7QCwa7JJox
	kZoGpBfbPZO/hz8X4LijOhOrpdvp/PaKv+MAZ2JEASyucZP46nmtCjSX9rNwTKda
	ODs5r8bUB+t4CW4jNwa5pxNayr884fdMD+CTYmlMqwra9BBPTWcr97XWPClilgbf
	FSLL7DeRjxNIQQxw5MDpkkOj9dcpM+IHi2JrPcJE9gCSBLT9X6yQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w3vhnpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:55:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PIF3Wt011115
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:55:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tddame-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 18:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKElHMuO4E31HV6fLPkpSjdJdpBtJn+jJS11Z3ouVaFln5EFWOEp60w1gsJY7miDaj1vcTxv9FpCU6l3bgsNg+8voGSeYY6VMp/jAmCy+o61pZ91STqVwUSq/GrzXfwtMLeWeLe6kC9hDBBazFoOX28eyV4delw2892Rgd80gHFwx4CjYpiJuuSeSms9fVEoME4bBXFP0e9lnfZ74jsGTKc3mGlea81OLlp11mymYCLB10OHG2cIofO5leqFnWpnhw7CKKePaRbT/zqWH2b5WoK5YzZR6TZXcglxtShcwkQPtdA1EPpRVWnecdBrCZoT5v/FDlLV+u93HSkcbeuT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxnGHv/J8SFUwPBQX77VfIBtNQp4a4nycrpddS6etuw=;
 b=zRGRNJGN913sFi+OgGohYPs8pCrSTQXEyudyyZtrpuHWESyYmJ1HwWSoWcf2WTiRN8YkC05zNupF2U95loAuUSD0amef6iZMFB6m0unrCtdTb+z3B/t6ZrkVJaINTp+3bXTJ8Bd0Dl28P4Cg13aS8L3r/WJPCmVqUpmAaVXFY7mASATnF6nJU99Xnp0LJ4qm2yioXQJPIJ54X/WXEKmacJApDpWBY+KiCEnHG0QuGdL3WBQdZvyGsqi3bUjOdGfnOH/pjyyJxhfjlArR1INESL5HzX4XRc8lnrbStaWJY6dPfeioOs5elYO5VNSCYa5vk5EgbcGoUZJ/Rip8iJFcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxnGHv/J8SFUwPBQX77VfIBtNQp4a4nycrpddS6etuw=;
 b=vHKmeAcn17QEXHOyRevl25II0Cb+W+hT7FwiOYa9+6e4BQKTQ2vbpXKKGd5iujiY1PewumjuBDnNZE1ii7/c09y8gZc/1fduldEqq6FRgNBTcBzZCnraJrBgDkZnfWhxBfx4Ww4COCKSI2kbpBDnxkr6iRF1Q/bOJQAXb1A3KT4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB6423.namprd10.prod.outlook.com (2603:10b6:a03:44d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 18:55:48 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Fri, 25 Jul 2025
 18:55:48 +0000
Date: Fri, 25 Jul 2025 14:55:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Free the DIFO for a probe once it is loaded
Message-ID: <aIPTMUiUEPAe2wwF@oracle.com>
References: <SJ0PR10MB5672176142BF978BF54B249AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87o6t83yiw.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6t83yiw.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0c0771-2d21-4f49-ff1f-08ddcbacde3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wLzJ6cLblW6CuTt76Jhglq3ZIbx4Ts8h7eSMyYXPlOeZc3wzEsfp7a7BqkFP?=
 =?us-ascii?Q?fz7ZFQ3t0c/xsd20AWXqEQIYukkZW3p7Y8fIWmpcqeMw15PqY82ZZodb0GGN?=
 =?us-ascii?Q?6BTGQtOZIJmi1Gyie+YjyfUSjOZUVPH0BjUO1geij8NgOz1bWqMX7Ve7tpbL?=
 =?us-ascii?Q?Aeg5UijDGs4Msqh05qlLrLb2Zexgeac075aCJC/raqEjYO4eMS7+07Z4GIdZ?=
 =?us-ascii?Q?HCcifNqTPmJrYnzf8QGjoqI145gz7gzK5THETYS/e8urxaXEWF9UdfRZGbB/?=
 =?us-ascii?Q?oNWCY9XcKK6e2eGL1dzmFC6DKnh8lS96cFVGqOC+EBxnpmWVBd3uLsP0F8If?=
 =?us-ascii?Q?QPN/UXUiAlv3OQVx1GXDwDbBOsFwjbMYvbvOkKKeJvWuVLrX2Uplf3ZGUbN3?=
 =?us-ascii?Q?ul01igunUo6qNxN1sU93T9qKCu/oLbeT0sby/4FMsjZu0S15MV+HXcsdwN4m?=
 =?us-ascii?Q?5Pi6b0Bu7GlBT6uMXHkcMlCQ/5j3pbMB4wpeTRNZMBhy7dEzneImx/Geu/Ip?=
 =?us-ascii?Q?VweIQB9VJ6TIMxX5Je58Ig7wptMsn+OzRR13twBdVUDaClSQAa1j6fNdvktO?=
 =?us-ascii?Q?epdw0pqFTA7I3DbYRUzM6LuBRMPZL25NPvkcqnG4ztVWNxZii/b0t88l0W2J?=
 =?us-ascii?Q?OcOfpcqrebbcKcbW2ybZC87ltsA51swLX0xyMQz7xw+ALV5q26HPGjMWWzH1?=
 =?us-ascii?Q?Aua48z/k0GQ5fda/okLS5KMoadfLf6Uq+hZx9oTm6SUf6pNKLHKePRL3rfQL?=
 =?us-ascii?Q?n4xMUyUTG+yD4X2stwisCWiCKViEbKCHpj4MywbKs3+C8u4D1TCxZGfl6zrA?=
 =?us-ascii?Q?RTCLj9Y3cP4gUm/5tmQP8efncQ86yUEhJhsPzHh/apXeEMwH7t0CbQQv44Nr?=
 =?us-ascii?Q?oOWk/zPNIG5OziPGsLwR9fvPrJK7Oo2wozOnDevFpxlf7/UgwCXGn18LSy76?=
 =?us-ascii?Q?Tu/JWeSlvROIyxeRNL3LoZNJ3B78pVVnKs19rwlWSLpsZCm/AhPh6E2+ZU6Y?=
 =?us-ascii?Q?cqWhCXooRTI6rBX+XTpkBPMyb8ztJ2MeHqSWkdoc6ixCag2pn6JiZRgneGlv?=
 =?us-ascii?Q?kUWvyP/VVS4CXVlV0ylNC/CLfNFgz3Gj/+48Smf+qbx1x/eUHjJpdUSzIZxu?=
 =?us-ascii?Q?aQLCJ8+jFPL/SiQ5+nJHo3wax4OE5sFzv9isMI2ofKHYq561HDQTLSQzaHhm?=
 =?us-ascii?Q?in4/lvB+d7dZSfphxZREg5iH/uFdeM38TeCn7MZemqqPkMCd0Of1rv1L1D0P?=
 =?us-ascii?Q?CPyTc2B84SLWWpxgyGMXGaFZD607hAJW/qJzezouGkoaWH90OaH9IXviLtiT?=
 =?us-ascii?Q?IIBcGMmmdJEu2hMlpIYttcHEllGAQqHMSEzlKHGZ+SnEFJpp/v09bQzjPhS5?=
 =?us-ascii?Q?QYluTD0i6UknUvg0CqJ4cHblcpEGs+S+2zmKDR3atORyhhmklA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bQb4CRBB/vpe8iXMMcoE7XuT1eiqc6GKRnSmf3vjTkzA2ROCjmffG6EYIPgz?=
 =?us-ascii?Q?G+AGrOOAjOOj2jYojBysCPXtpDL+HeP3jg+OqJdi9wu6Xl3/KOoidWhw0SCc?=
 =?us-ascii?Q?q/FF+QtC5/LRmsuDvRrPtRpD0WOPnjWfIdE+Sqj393BYjzXwyGo+nKGCbFC3?=
 =?us-ascii?Q?nUKS3GeIqY9BDOVyxbRT8tdZ53A7n5wpsVsI86EwphekuDL6jl6LQkFtNrCr?=
 =?us-ascii?Q?OPHALddcXvAXaeJPb8cWYD00e1hizQzgBOSiiF2mP7y8ru7KTBFqbjHvNfOd?=
 =?us-ascii?Q?SD+Zotq9OK1FqbvKGokTbniR3kdjcn4Jqn7BjyXkikjpEMvQaUAaE68JJcF3?=
 =?us-ascii?Q?B4CzZBTqvaYW2b44IcpMBcw43NIryYm4uvU8Tldk7p44hCzxkqdKhNaWX6nn?=
 =?us-ascii?Q?Ca19MvU6xFoIJiVQqvyOPep1BodGHu1LhXPGhY6a1PJP2ph5y3PSyZvYKO3n?=
 =?us-ascii?Q?WQmgG3F3i6F5nZaujVPegFAqo6UDD9kkN0WMjwUFqfhleCtGrec3aHL1SffV?=
 =?us-ascii?Q?VizjRlFOjnxROtJOCVuqibqAiabb/iQCIb6HHM6mVfLazHD2GiSyQjRV83mf?=
 =?us-ascii?Q?O9Q8T4KT2Ta4nARDVuCHcS0xKzoNRqGDBQdVROhe91BKzjbzqUXnhwwdnYyi?=
 =?us-ascii?Q?KVZ+fPnHfZ8Z6n9CmJTXpMUVPRmizcymJXB45uXYpgDfQyFUdVl2mgrS5hgV?=
 =?us-ascii?Q?oQAz+9RiHna5hvhZR4Yvstokqv14dTJQQScGUVST5ys3E1qpCGsDYizapWgx?=
 =?us-ascii?Q?7oHgDUZ2bbTBjz7QJR1zcASHcWX0X5hsaJz9zFEKi2Xxz4qLFANdJm5DcYIy?=
 =?us-ascii?Q?01wq1ultrvWblNpBfOebBVDHzw/DyyaouYBrBkXYC/FCB59CXHwIlHRnJTYB?=
 =?us-ascii?Q?mCP2QebiER5/QDLUUZRQdd7y3iF1JE1E2HoSeYUp3loaaXljSvUhC7Zww6P7?=
 =?us-ascii?Q?dz/VSt2Gh/t+Qmt7hfp325VGA0lK8havQWlToLRrjMVBNZp1uOBCAz+9qSVk?=
 =?us-ascii?Q?mqxI0xQhDKHs7zkgTYT92h9c2e8vCvnahXX49efs1csN38Dw2kp/q5tU1sgp?=
 =?us-ascii?Q?Nqu7f3uaXEtbnBg2fQLcc+V1waQtqqiO37bMKAHQIEh5aaW1A2la7aZLdmkx?=
 =?us-ascii?Q?OzrBsXP9AIxAwCn6Hg4J85HnUxuGW//lFKwDY7ImRei2jI6rnFV40MPaVxlU?=
 =?us-ascii?Q?O66xQQzCOGW1f+ahA46fiTsyJCSE8vfAdZXbdcNBUR0Wb9u0VHIsn8lG/DPk?=
 =?us-ascii?Q?chVEIULUpm4m9d7+7Xs3g5jmB9R71UWw806CJIfPIlzUDEtjUolIF4stTvSz?=
 =?us-ascii?Q?BeKCv7AoYqr9m633aaVFE4nX9BkPJ1uUkRB//igjQUNm0q5AVVvAqJEuX1L/?=
 =?us-ascii?Q?VLqhC17NXw/M2qwE6u/i9Aw0faCWr+vJPVf9cWRyHBOhFDZmNvhFE1vGpCGi?=
 =?us-ascii?Q?vujbHyqkzhTLP84Mw+rW6/DiHUCZbN3jJB4btZo0nKAUtqzKVx7PB5FVnQnS?=
 =?us-ascii?Q?yIYlnlkOS1urIURNYdDIqXxfQwmG2yJOx7oRq0wTBzHMCQ+tAGk3ehEI0UXQ?=
 =?us-ascii?Q?XH8EuQVzUpPgeEECnB/XSBzJn7Zcj8igK2fm0p/4ZowioZXvlRD/BCvUS0t2?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dN6JqEL3y2IFLD4Q3mc9ASWrJYyngScWIze8y5zuddvMiSpCGczSv597her7KULWqvNMGtwUgqIo5eeAIc6OxOJvTqihOxyaxZIVcm70zw7fQofbfJ8XVIyHjVO2p2XCuqqaHUWNFYJXxVrSrITqhCE2SJl4b/SZa3mCQ3LhV+PSG1WKT3hzRPEEsyGfqYeV2m5nH1Vho7+iSc3QZTkHu4BlnMGB5rSNsua1fuT6QKhKx4L+5Eg1DztjfLM7Kc4FeeuSYuGIGiDY2QRR2Lw3DjybRX8jMWTjVm1jJJTjB8V8aUrcty1i0q9bXsS0pQhJ/fcITCTG3TthkjEvEovb6ejjxSlu8s8rdgfGDP0JRvIl3DFYSRYYT7qWmYQEEyGH/eD0Oc+jgxryWmw0mZJukyLWht1x11nRQAc0GVDs2pbTL4CsO9ImBJH4izqeHDzMsf+zAW9ZhFsK2konhJCZdmdYMDAp+YDQxRSUcQJeMvQcgoukEupnx0Rx5mRaFUUYP7fTHLP8Cw8iJ4LCxA2XrI0v0Sjr6CMlLmBGGku2v4fLltcFYThZleQDBgqoNmRWsY+qPFWur5ZpUG7N3Eeh6p9x8039AphpGJRs7qvMRiA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0c0771-2d21-4f49-ff1f-08ddcbacde3e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 18:55:48.1052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG1qMBGdpI/bvJRPFPYgMkYqz+dvy9oHzZoguK9mAdh4WMPZMGBWVybQkQnL3stT2DOPGjK+7eqW2WUccbPnZo9ZfHRFEvUWgBe7usoJLT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6423
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=899 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507250161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE2MiBTYWx0ZWRfXx4RLBN7zXL9j
 CnCVwLdW83uANNRJLo0dLfqhGepnlUqTtojWMIokNOSTawoPu8SCOUeAOwAlrcgM/MeFf3ql+mW
 vVYYMRqWeISbAKlaNjhBuraGImYr0AKTB8E0C9OQADbGnesd+Ox+empzDnCWEXUXUsTlQEvvr0W
 FRLIXBBPY5Axl7yMK7JpITrakkHT9tIkN/51uYycU9gfOgF8mQpiIUxL/bstMN+8sh4+6iy1KeQ
 XC8R+bhx9wyZG7wz6vzXiP9t8FwxXQdQLBlHQTe9dWsAQ+XZquoQvtfEfrx+4rei2Ggyq2OrCoz
 1c84b6uby+TMn4JpAh80OgVqQp9V8UB6O/wl1hbdCcG3eJDC+cquYoM0W4VtXTZdzefsCeEymvw
 QjHM//98T+5mDV3e4cgqRWhl7P8BOKpcasRnYNi3OMomKlxGsldauRyrvmbTb3Tm3HcdkR5h
X-Authority-Analysis: v=2.4 cv=VqMjA/2n c=1 sm=1 tr=0 ts=6883d337 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=CuelDG_OGeiJGSSr:21 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10
 a=GoEa3M9JfhUA:10 a=6RfB-sG7P5xszPfUApcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: CQchTBvSxTVCxC72HknEDalY53zlwpJ1
X-Proofpoint-ORIG-GUID: CQchTBvSxTVCxC72HknEDalY53zlwpJ1

On Fri, Jul 25, 2025 at 07:39:51PM +0100, Nick Alcock wrote:
> On 25 Jul 2025, Kris Van Hees verbalised:
> 
> > When a lot of probes are being probed, keeping all DIFO around consumes
> > a lot of memory.  Once the BPF program is loaded, the DIFO can be freed.
> 
> DIFO? BPFO, surely :)
> 
> ... the attached patch only seems to free anything new on failure, not
> on after-loading.

Oops, yes, will fix and send out a new one.

> > +fail:
> > +	dt_difo_free(dtp, prp->difo);
> > +	prp->difo = NULL;
> > +	return -1;
> [...]
> > +fail:
> > +	dt_difo_free(dtp, prp->difo);
> > +	prp->difo = NULL;
> > +	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
