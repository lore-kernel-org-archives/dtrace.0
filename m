Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7A1E492
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427184; cv=fail; b=LyLBM9dfk9NMK/Ujg2xjRl+vaJ6BQWSoOSaOB7k4rxSBoXzlpXz0QY1ba/To6xyntgsOq3AG7Lan6j/Ksk3+V8JhtvUGfAJAyQL9p99I41mL8K7Jfs1t9oiV7v97oPvLMQnC94H/d0lE2X5BzdWL++i0DBRMGCYhlztkXr/Po8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427184; c=relaxed/simple;
	bh=Ld4EcyjXWKIYAaklck99PFyw3CXNhYGKozja16+F7JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bUnl81Tz/AgVVB4TuxH3FToVmJmd8KaWemvWHwZ15QExopQvc/SCN1XgunrgXmewSsvBxg+YfsYAZJ6TBKpmh8is0ASQKs67G30Ys4ie/oy870GiTk+Qmx/aMrWHN8F14uv86BRSz58BMbxw/6xBgioTS+F74gAIrcqnilyCDyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jG9URKLH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dPPIzC/u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jG9URKLH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dPPIzC/u"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JBoLs007478
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 19:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=oUlEQ+LfjifvPMd3oq
	gko7hXbVU4LKxCvOe55HSh6hM=; b=jG9URKLHxEzBXqQFebsvbZAD+WrCUlypoy
	u6YaP84EUeGZ1pT+YXrj8Fg4XCBxV4+sPnomyRxxzxnOAqgSvky1Ije/bWaPjY3u
	3bJQfaaZfd86tefe6FvWLDjsnHYqYXlKnzs3fjlq6PpfseLPImefaiobBMRKizGk
	ya1jtBYa1HVNNcdgCJnUUgizAZQFoU8l+K7XwqhonLzfJ9ZS+BoUh1xlA9bn18Xe
	lKPmfLnrpIt2Smgb5z+mwjsZxwbT/BH521qUfEkyCjRLQkke6MnfDK5So6tj9Lt+
	PCZUMRIE9+Xry8pn5vurBy+VUtee7LC0aV+U60406G6Tg6kFnuVg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbv0v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 19:33:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5IHXkO040142
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 19:33:00 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836xa33u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 19:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lp4m+9cO1ylKNZwAx6pA9E9pfVVkfmPCLDW69VnfYLjevee5bliA4t9TT0ofyzgo0p9JGrLQLwoO10b8oCYNYBDGgeYm1eLZtrdHsyGZzL9bow/DpFCBwApaWhgadiyQvWmJLim5916NiGcjCi6rmXSTyuy++daH5tDb1j1tOF3dhVm6N/riBNHbsnMtKGUMllhEjciBfyWiULpVOqJ2Te8Cz1uku1z/13e2y5DtifYRQCMjVQAadG9c+8+VUjHnYwVzgpkiN0/eTvR2Iz/G2QFkbaOePcCHjB0f9NaZzV01CssEpB9bv29/1W2NsIevf/OXOmh2PaBewBlXITRy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUlEQ+LfjifvPMd3oqgko7hXbVU4LKxCvOe55HSh6hM=;
 b=L8wlpL/F13whPwBXDxxnqG/TPybE13mI5T2cr7Lf4NlCzXPz2k4tk1IMAfpsNV7W3wR2ACrNvZ/X58TReQLbipwY0AXQY5U8Y+QtiIRCVnFKBmQYqfy9AoO+BrJwsNNdWWtg5OzDY5kGB0D2arpkmY2nHKGYTDCumSHCCvIKrtr5GNVDjWLNSUy4HDBM/0KysurakwI4wgf1FdG7E05VEltZ1ld84+i+WJhrkwy0FcFE5GdK2stRmzPVbeEn3B+lOXgg0BJvZOrlLY1Zw6tJw0vavSFcL1iCKlKaLPM1NOLINEcILieZ1Fnm3sOEOSECxWn/FBxyWMnXn2Zxi2lwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUlEQ+LfjifvPMd3oqgko7hXbVU4LKxCvOe55HSh6hM=;
 b=dPPIzC/uosVdQGnhBgLlXt47l8iMnrr30FSR6CqixPf3zI1l0MZCVWTQ+z/++cCYYqbCGnpwvDju6vEqio/rsGCbLharWbzVWXlYgbd3MN7n+4A1OIM1UpTBDsr0P0hK0g6zLR4KF91ZTTuhMhn++nH34dj44cJ3X+3makA/5RY=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by IA1PR10MB8211.namprd10.prod.outlook.com (2603:10b6:208:463::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 19:32:56 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 19:32:56 +0000
Date: Thu, 5 Dec 2024 14:32:53 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/4] rawfbt: new provider
Message-ID: <Z1H/5cRfKJ/4eCNU@oracle.com>
References: <PH8SPRMB00375EF399EF3CAE90C6573EC2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8SPRMB00375EF399EF3CAE90C6573EC2302@PH8SPRMB0037.namprd10.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0429.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::14) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|IA1PR10MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 83087c60-5d87-477f-2bf9-08dd15639ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EwF7RjK024Uvj7bYlBULJVEfGIMUXElyhBBQYHa1t3FGFeFAuuA1FdJkYSNr?=
 =?us-ascii?Q?DZRgl/vjYClZmfBZclTp2LRIBFyCYF4f5bP7nbI1H/HQuT6CxipNtd1ZBTdc?=
 =?us-ascii?Q?5D5Wz2EEoR0m9Zn9BFpmJj/2oNcPNMKqd+TFvct/uFbAI8ShZN891R+cr/4I?=
 =?us-ascii?Q?aOfY9IY5Pq0Dsa/dO0j7631zlUNvHzzJhHsTvlSbVwNylrNMBldhHyPExz6V?=
 =?us-ascii?Q?yt1jiTwrrWxQ2ddpqhwUfnJY/k/fyzS3p//EN/dbhQYw+J1yrun1lxn8KtzM?=
 =?us-ascii?Q?kLWDvu+pZ5jSFEC4upkI4p1kI1btCq1QVnLXWasLCDp1nCDnb1I3JoG6dq3R?=
 =?us-ascii?Q?z+jB7nnIDzscfCjL0mtQbPHJIZNGO/DNonMRj9+pA9vsvbvMJapkBsnZ1nnd?=
 =?us-ascii?Q?097Yj53nZN3drgMbs5rFsMnGYil917IiOddju7/kF18y1ShR89NnIVe3BuF/?=
 =?us-ascii?Q?sH0ewKt7WG2i4xuM5F9fqg1GK8AKj7hDjTkTYLTRYlk+eT8IkShrDWoL5C0G?=
 =?us-ascii?Q?WphAgZ9P0vz+FMr934tXknt5MLdfocEn4lg929oGaGh6vUWKk0iRYkQkf7jy?=
 =?us-ascii?Q?svjLy54XG7GTNJNEbHYfrPJhcGnkAtk/Y2rlbpkkWv87gY07EYIKy6PD2n9q?=
 =?us-ascii?Q?0hE0ySGtMwcjReQyPSwS84AnCVDxYUA26FTEtww9bDBynhaa2+u9Ha/cs06s?=
 =?us-ascii?Q?49vlmr+93A54g2ZXR7F3oUe+ep1UjubOLnRUotBkDep0bufssLsRzQNPcNpQ?=
 =?us-ascii?Q?CapPVwtiKYnU84AwIs4nU8rcqjlICE+lz0Cm9byPPBdFtxh7Rnyl+Wd+GGQp?=
 =?us-ascii?Q?alLNZFth5kAIIizCnY+Aogf984BLBvp4YblJTthcL2i9B1lbJC6HdriVyQJ8?=
 =?us-ascii?Q?SD9QFi47ejOlcbew3SGw2YOu87RVwQdv7j2N/h/qHQMGjJaEQKTPYinFeNiY?=
 =?us-ascii?Q?6l4DBXjBfuxvS3uk4ny6bo47RugLSWoZjA1gfYzh02TIgBa+NbGUVWg1A37M?=
 =?us-ascii?Q?6YwELM5jVRsxZcr77FJTyDHqVP13mXPhoBvzLpTwm/ecMcur5qFYg06s4FIw?=
 =?us-ascii?Q?EinSj0/RqS/s+TWWb2MSL0YkF7nF9Du//Y3AdNiySXsVuxxdLdPmaxKMPEF3?=
 =?us-ascii?Q?IVkvnvK+Nl1EXTCzata6mPzQ1WdIhkpbGQntteRrxM/1uEwuQvbt0VKFC/1R?=
 =?us-ascii?Q?spIk1Wlls45r+bNvZ52XxWyXu5eqdhtIAAsyNf3dDy6QhG6PiNw2vD3SfhTM?=
 =?us-ascii?Q?YrGdtuwvTNs0Rbn/VuSu/DmTKRwrkHYQ636sQGaBxeCviLJqC/T5PHnj83ad?=
 =?us-ascii?Q?YimqRxw7AHpGGS4rO0uOjDSFtW0aSlorC5EDrz/U1UzEAhjdn7zPY+2PO2qo?=
 =?us-ascii?Q?oaWpsL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dq0KZLw2O4pVYfAjdkDAnc3dOoQXzHez2Ht4bmxNjDqic3eMVVpEOtPlOBHk?=
 =?us-ascii?Q?dXP0VM8wTe+/TCq0dQi7v1ED0jU1U8M9xJaBG1kZlh6Cq3sNFAOT887VIdY4?=
 =?us-ascii?Q?DvRXmvHeJDpGhXDXS4FtjrxIXpyMjWbhSjrWlrbU8y4m0fEOWJLSLagNgglU?=
 =?us-ascii?Q?BWsaHL2nAMzAWFyK/NK+IjfGFf8Xbt9k2AaYNVxC3f2GbA2Vft6vac5blu1W?=
 =?us-ascii?Q?NZ+aNCg11dXlR3W1yBtLJhoJyXhmDaLg/6deD0kCtbdl56g1/XbWCDSPd+cm?=
 =?us-ascii?Q?SPXq/LNsfSjOhW7U8lUZVhJNFdGRwDN/yMmwPHO9QAo6blrGpBi0mgGXnyUz?=
 =?us-ascii?Q?p0waFKTffKNTDO/+rA5YiEI64iDDGKllSvvAS/s7nXzVUQloDLTCDhG4AB51?=
 =?us-ascii?Q?O4kZzYoYTuFF3XBcPIcl9Ra+i+fAYJPoGYtqmVG5d8VyuzOl27TOPoDke2V4?=
 =?us-ascii?Q?SV2FG8EDKK+PBSD3BxiUSxrl2MhYJyBh6ZVi0s+jKg5elTpte6GO4vDf1W4f?=
 =?us-ascii?Q?e14kNjRaqWFA4DRQhC2BmZMknH1ICK5em4t2C+DFhoE6pUN8pBcDrqzUtch9?=
 =?us-ascii?Q?GUaSG9YlaEDVMhd49ko4B71XElTgiCUpXrk50BeMigmYC4mCkvswhOjAK+uU?=
 =?us-ascii?Q?gEqwBxx3wciDwcPbMdTecQvnEiqda1rMPCQBbnVDzRlICZP8adS+bt9vLcVQ?=
 =?us-ascii?Q?h7HdsFcnUdNWiYkhmQ53z+Dron24x+4oSd+/LHQ53fDPGEDsrCF3wDOtlaSf?=
 =?us-ascii?Q?U07mUlHrlQmj1LjbqgsCzeaKRySaMv6aqN5vKXyvkzbBLLOfDbeSKFlHtxLU?=
 =?us-ascii?Q?Wo8IfSirVrZSYj4tV8+H2Gxtmn7LyHdu1dmg5QRTUMTLYZDFTX/ZcIjFmbDF?=
 =?us-ascii?Q?Gcrtz/ud/r9KCkgBhBXIpsRZbuWH/cAiRyXDVf4KbvC5s/GZ4ei2slHMaQEa?=
 =?us-ascii?Q?1TfFH2XTwO91vNsu8rlEI1RSPNGApvXCPHSBBGJEcBZpvral3ZB4luOOEroq?=
 =?us-ascii?Q?WyxY593M4Sv3sZ832YROwaOq0dwx2d8iLpVgccvraOen+YhevBUjDW+01kX/?=
 =?us-ascii?Q?4U3ZXL//OOxYNFgT/1zqZg9jRJXrNUVh0IMVBe/Awtb7yW/nDShHAHrI1taU?=
 =?us-ascii?Q?9aHzwxZbIU92NKNiNc2ok31wn5TCoPa7KOeP/emSnq5Gnh/MwTpPcoYLY5ng?=
 =?us-ascii?Q?Buwm9nzGPANUVscTR3ut2mqCW6ehxXN60ccmIA1wHq+ckb3hBHU5hRl4k/HQ?=
 =?us-ascii?Q?lAY6WfbgYn/qjA19nR8wYZ1IKICFEtgWpZqnWO7OaCFkCk0Us0PbXGyLPBHB?=
 =?us-ascii?Q?F3Zot4l+34mIC3F7ixsEasPg5vGG6+wWDS+MDGxbaomMqvrgm0NChmBs45Gh?=
 =?us-ascii?Q?MV1XYe5WFEvLht9wR0OD3AlYalql6FMZpSOo6Fzu9uIVqUiM3iOZ0ENIsr2d?=
 =?us-ascii?Q?E1CTqG42d8B+7VL6KXPczOsyGMZuBb/088EkX6PLsOULkx344zVNp0/qGnz4?=
 =?us-ascii?Q?gx/kJKuH3uuf+6zfjiXunPdzpfWeO9dUwDQcmavCAy78aT1HMoMgVHHKWxAI?=
 =?us-ascii?Q?pxWIv2wMeMfthYpplyfgkULEwBExerhnxxzq0A4sTVSWzxqOV34ZfJOWT3um?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W7aDTMlQxX9GNqA8EQNz7qk716UXiO0+DK7RtasVvvnuZob/Au2tpRi3CE8HUtbcLQ5jGWn4lHEMGaIPbZf3ni0zDGay1blEwg+TmxVh0AjADM2OCodthDwKIVtbIOQJsfUujv2anveY9X64h7jKE4AU6d514XvQTwd1cmhxmaIBcoc8l5/ej5Lo9edfaKK2vsQZ2hpLMz7PLR8Fnz1wFhLsDM2TUMkWjqDyAI490F4PVlITC8pddluXoVed1et1wqfR0Wf6t50Cn0fll9gv0l3vrle+lGrMgoWTYmf4wPgHKp3TAln7BUHon1rgunRqBfaiOXoHLSkdnQd8H2uDlkYf0hHgmRdKeBizWM/wjD1Xp4rtHpPh2gGK5+jtJcYjYa6X7Orkbb25HtD78MhTBdxSkApZu/X40kfWkEIAeMVh/ztfKDV89B89kHMs2+/M5iqNHlU7WaYn3eMj2uqhAdnFZ6IuaCrzZUZRql2F3bUQtXWkkdpdRAfynptqe2WZtRv8hAPdvXUh+teqqHcnY0JarRZqOakeX17I0+Blh1gtAIVDDHEn/A9TRNZTrPFRmeb51kwtfkRAc1AVUKCl5o8er8wuYWcK0VVb7Llwf1g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83087c60-5d87-477f-2bf9-08dd15639ea8
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:32:56.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++3615NM4tJHiTeRihl4bPD2pAadRUPNBpNjfX0lrjgmvm1hMt9dL+2s2Nx0trje3L0+vO425RfVBTSHHzmAXRw00zowr3AcGJ00lT+Bq+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8211
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050144
X-Proofpoint-GUID: g7PLb4z07edI3F1QERl3YreSRLKuEFxa
X-Proofpoint-ORIG-GUID: g7PLb4z07edI3F1QERl3YreSRLKuEFxa

Hm, this is smissing a change to clean_probes.sh...  Updated patch coming...

On Thu, Dec 05, 2024 at 01:53:29PM -0500, Kris Van Hees via DTrace-devel wrote:
> This provider provides access to all kprobe-based probes that are
> available on the system.  This includes any compiler-generated
> optimized variants of functions, named <func>.<suffix>.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/Build            |   2 +
>  libdtrace/dt_prov_rawfbt.c | 330 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_provider.c    |   1 +
>  libdtrace/dt_provider.h    |   1 +
>  4 files changed, 334 insertions(+)
>  create mode 100644 libdtrace/dt_prov_rawfbt.c
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 8d398221..72235159 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -55,6 +55,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>  			  dt_prov_lockstat.c \
>  			  dt_prov_proc.c \
>  			  dt_prov_profile.c \
> +			  dt_prov_rawfbt.c \
>  			  dt_prov_rawtp.c \
>  			  dt_prov_sched.c \
>  			  dt_prov_sdt.c \
> @@ -112,6 +113,7 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
>  dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
>  dt_prov_proc.c_CFLAGS := -Wno-pedantic
>  dt_prov_profile.c_CFLAGS := -Wno-pedantic
> +dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
>  dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>  dt_prov_sched.c_CFLAGS := -Wno-pedantic
>  dt_prov_sdt.c_CFLAGS := -Wno-pedantic
> diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
> new file mode 100644
> index 00000000..edfd36b4
> --- /dev/null
> +++ b/libdtrace/dt_prov_rawfbt.c
> @@ -0,0 +1,330 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + *
> + * The Raw Function Boundary Tracing provider for DTrace.
> + *
> + * The kernel provides kprobes to trace specific symbols.  They are listed in
> + * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
> + * a symbol in the core kernel or with a symbol in a specific kernel module.
> + * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
> + * provider also provides access to synthetic symbols, i.e. symbols created by
> + * compiler optimizations.
> + *
> + * Mapping from event name to DTrace probe name:
> + *
> + *	<name>					rawfbt:vmlinux:<name>:entry
> + *						rawfbt:vmlinux:<name>:return
> + *   or
> + *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
> + *						rawfbt:<modname>:<name>:return
> + */
> +#include <assert.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <linux/bpf.h>
> +#include <linux/btf.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +
> +#include <bpf_asm.h>
> +
> +#include "dt_btf.h"
> +#include "dt_dctx.h"
> +#include "dt_cg.h"
> +#include "dt_module.h"
> +#include "dt_provider_tp.h"
> +#include "dt_probe.h"
> +#include "dt_pt_regs.h"
> +
> +static const char		prvname[] = "rawfbt";
> +static const char		modname[] = "vmlinux";
> +
> +#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> +#define PROBE_LIST		TRACEFS "available_filter_functions"
> +
> +#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> +#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> +
> +static const dtrace_pattr_t	pattr = {
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> +};
> +
> +/*
> + * Scan the PROBE_LIST file and add entry and return probes for every function
> + * that is listed.
> + */
> +static int populate(dtrace_hdl_t *dtp)
> +{
> +	dt_provider_t		*prv;
> +	FILE			*f;
> +	char			*buf = NULL;
> +	size_t			len  = 0;
> +	size_t			n = 0;
> +	dtrace_syminfo_t	sip;
> +	dtrace_probedesc_t	pd;
> +
> +	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
> +	if (prv == NULL)
> +		return -1;			/* errno already set */
> +
> +	f = fopen(PROBE_LIST, "r");
> +	if (f == NULL)
> +		return 0;
> +
> +	while (getline(&buf, &len, f) >= 0) {
> +		char		*p, *q;
> +		const char	*mod = modname;
> +		dt_probe_t	*prp;
> +
> +		/*
> +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> +		 * The last line may not have a linefeed.
> +		 */
> +		p = strchr(buf, '\n');
> +		if (p) {
> +			*p = '\0';
> +			if (p > buf && *(--p) == ']')
> +				*p = '\0';
> +		}
> +
> +		/*
> +		 * Now buf is either "funcname" or "funcname [modname".  If
> +		 * there is no module name provided, we will use the default.
> +		 */
> +		p = strchr(buf, ' ');
> +		if (p) {
> +			*p++ = '\0';
> +			if (*p == '[')
> +				p++;
> +		}
> +
> +#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> +		/* Weed out __ftrace_invalid_address___* entries. */
> +		if (strstarts(buf, "__ftrace_invalid_address__") ||
> +		    strstarts(buf, "__probestub_") ||
> +		    strstarts(buf, "__traceiter_"))
> +			continue;
> +#undef strstarts
> +
> +		/*
> +		 * If we did not see a module name, perform a symbol lookup to
> +		 * try to determine the module name.
> +		 */
> +		if (!p) {
> +			/*
> +			 * For synthetic symbol names (those containing '.'),
> +			 * we need to use the base name (before the '.') for
> +			 * module name lookup, because the synthetic forms are
> +			 * not recorded in kallsyms information.
> +			 *
> +			 * We replace the first '.' with a 0 to terminate the
> +			 * string, and after the lookup, we put it back.
> +			 */
> +			q = strchr(buf, '.');
> +			if (q != NULL)
> +				*q = '\0';
> +
> +			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
> +						  NULL, &sip) == 0)
> +				mod = sip.object;
> +
> +			if (q != NULL)
> +				*q = '.';
> +		} else
> +			mod = p;
> +
> +		/*
> +		 * Due to the lack of module names in
> +		 * TRACEFS/available_filter_functions, there are some duplicate
> +		 * function names.  The kernel does not let us trace functions
> +		 * that have duplicates, so we need to remove the existing one.
> +		 */
> +		pd.id = DTRACE_IDNONE;
> +		pd.prv = prvname;
> +		pd.mod = mod;
> +		pd.fun = buf;
> +		pd.prb = "entry";
> +		prp = dt_probe_lookup(dtp, &pd);
> +		if (prp != NULL) {
> +			dt_probe_destroy(prp);
> +			continue;
> +		}
> +
> +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> +			n++;
> +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> +			n++;
> +	}
> +
> +	free(buf);
> +	fclose(f);
> +
> +	return n;
> +}
> +
> +/*
> + * Generate a BPF trampoline for a FBT probe.
> + *
> + * The trampoline function is called when a FBT probe triggers, and it must
> + * satisfy the following prototype:
> + *
> + *	int dt_fbt(dt_pt_regs *regs)
> + *
> + * The trampoline will populate a dt_dctx_t struct and then call the function
> + * that implements the compiled D clause.  It returns 0 to the caller.
> + */
> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> +{
> +	dt_cg_tramp_prologue(pcb);
> +
> +	/*
> +	 * After the dt_cg_tramp_prologue() call, we have:
> +	 *				//     (%r7 = dctx->mst)
> +	 *				//     (%r8 = dctx->ctx)
> +	 */
> +	dt_cg_tramp_copy_regs(pcb);
> +	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
> +		dt_irlist_t	*dlp = &pcb->pcb_ir;
> +
> +		dt_cg_tramp_copy_rval_from_regs(pcb);
> +
> +		/*
> +		 * fbt:::return arg0 should be the function offset for
> +		 * return instruction.  Since we use kretprobes, however,
> +		 * which do not fire until the function has returned to
> +		 * its caller, information about the returning instruction
> +		 * in the callee has been lost.
> +		 *
> +		 * Set arg0=-1 to indicate that we do not know the value.
> +		 */
> +		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
> +		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> +	} else
> +		dt_cg_tramp_copy_args_from_regs(pcb, 1);
> +	dt_cg_tramp_epilogue(pcb);
> +
> +	return 0;
> +}
> +
> +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> +{
> +	if (!dt_tp_probe_has_info(prp)) {
> +		char	*fn, *prb, *p;
> +		FILE	*f;
> +		size_t	len;
> +		int	fd, rc = -1;
> +
> +		/*
> +		 * The tracepoint event we will be creating needs to have a
> +		 * valid name.  We use a copy of the probe name, with . -> _
> +		 * conversion.
> +		 */
> +		prb = strdup(prp->desc->fun);
> +		for (p = prb; *p; p++) {
> +			if (*p == '.')
> +				*p = '_';
> +		}
> +
> +		/*
> +		 * Register the kprobe with the tracing subsystem.  This will
> +		 * create a tracepoint event.
> +		 */
> +		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		if (fd == -1)
> +			return -ENOENT;
> +
> +		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> +			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> +			     FBT_GROUP_DATA, prb, prp->desc->fun);
> +		close(fd);
> +		if (rc == -1)
> +			return -ENOENT;
> +
> +		/* create format file name */
> +		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> +			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
> +		fn = dt_alloc(dtp, len);
> +		if (fn == NULL)
> +			return -ENOENT;
> +
> +		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> +			 FBT_GROUP_DATA, prb);
> +
> +		/* open format file */
> +		f = fopen(fn, "r");
> +		dt_free(dtp, fn);
> +		if (f == NULL)
> +			return -ENOENT;
> +
> +		/* read event id from format file */
> +		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		fclose(f);
> +
> +		if (rc < 0)
> +			return -ENOENT;
> +	}
> +
> +	/* attach BPF program to the probe */
> +	return dt_tp_probe_attach(dtp, prp, bpf_fd);
> +}
> +
> +static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
> +		      dt_argdesc_t **argvp)
> +{
> +	*argcp = 0;			/* no arguments by default */
> +	*argvp = NULL;
> +
> +	return 0;
> +}
> +
> +/*
> + * Try to clean up system resources that may have been allocated for this
> + * probe.
> + *
> + * If there is an event FD, we close it.
> + *
> + * We also try to remove any kprobe that may have been created for the probe.
> + * This is harmless for probes that didn't get created.  If the removal fails
> + * for some reason we are out of luck - fortunately it is not harmful to the
> + * system as a whole.
> + */
> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> +{
> +	int	fd;
> +
> +	if (!dt_tp_probe_has_info(prp))
> +		return;
> +
> +	dt_tp_probe_detach(dtp, prp);
> +
> +	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	if (fd == -1)
> +		return;
> +
> +	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
> +		prp->desc->fun);
> +	close(fd);
> +}
> +
> +dt_provimpl_t	dt_rawfbt = {
> +	.name		= "rawfbt",
> +	.prog_type	= BPF_PROG_TYPE_KPROBE,
> +	.populate	= &populate,
> +	.load_prog	= &dt_bpf_prog_load,
> +	.trampoline	= &trampoline,
> +	.attach		= &attach,
> +	.probe_info	= &probe_info,
> +	.detach		= &detach,
> +	.probe_destroy	= &dt_tp_probe_destroy,
> +};
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 1e2e844e..0c621197 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
>  	&dt_lockstat,
>  	&dt_proc,
>  	&dt_profile,
> +	&dt_rawfbt,
>  	&dt_rawtp,
>  	&dt_sched,
>  	&dt_sdt,
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index f62137de..59a8d62e 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
>  extern dt_provimpl_t dt_lockstat;
>  extern dt_provimpl_t dt_proc;
>  extern dt_provimpl_t dt_profile;
> +extern dt_provimpl_t dt_rawfbt;
>  extern dt_provimpl_t dt_rawtp;
>  extern dt_provimpl_t dt_sched;
>  extern dt_provimpl_t dt_sdt;
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
