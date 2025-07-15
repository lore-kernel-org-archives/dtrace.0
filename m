Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9020110B
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592255; cv=fail; b=lVKDKNP7IfB4bLSMX7K+pQTQYO/O9D4W53U1xelbGWbN8wJF5IPYnxzlQNcx7jy39fJJeI5GXBqiRycWJbBslhsIn9zRZBAwr2eQsALCc24ejDvgneo1c11cmIr8LOuLpZaYIrvX4nvLAsv2mj6O80edAjmMwXvukLB9KblHGlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592255; c=relaxed/simple;
	bh=UCKn3f2jJUQZN5zIov3ay2ykdxcAoZDIi+H4OQ4OUtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RUajiCQ2Jjlt2AruJMkakqMy2pmW8bxtjywYDOmBpiMttJrqDX5z+pg/NLQd+m4+dGrzOd3qgi1aEFtWFCUE748eAW2Fg8Utqp/NZcxBV2SmdRyLyhr0v/TwZsA3ptz867vvhEiBDcddFjCL65IqpPA8ms/jGuB+4pAKr3WaBAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cizyZpm9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uQet1Yfi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cizyZpm9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uQet1Yfi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZCTI015147
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sjL7q+I9Lyz6CohP7S
	SWS44qJcslnq/4wB66GQAUnyY=; b=cizyZpm9YecBAEmZlw5Uo/CuNghTiRynJ8
	tXpo9/FYkbIFngDJYY+fw9nbSjGjdvHSo/KBFv/soQLrpsC9uzbakIzQFxB8zQJq
	5OnrcZOidb533QuTRKZT4dQrwMxo5bDA376gTUYOit8wnR/sljvDP0TZBl225RBL
	w74/f4GngKGfTR1q18Rv3CTjVZt49ExCHG4VjszNn3uyv6bjGarpXvrPADzVOgmn
	/DfjAF8HAZ7R/L8pjLyNM34ddTVJcXM/wQ9uZ1mgSoquVmW7T27qR1vjSxkMxeSl
	q37l8HfxKdq3t2yOVAm8E8sK0pWvIZhK9fT3YyHHoH6IBdUJ6SWQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1axwa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:10:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FE6wR9028988
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:10:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59ugct-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:10:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFmumklHBUBhy/AKoNVPNztS9fbrj23b0VbFKs6N161pXRjynyHlr1na6u4oEKIz9OeWqF7TyPY0Njqd5NNmuVW20ARWSRexv378bJRPg7ifeJ383Fc0yJLPitW/eaQ5C1wZcph9SkHzyG7BMB/PqkZMabRx88z1nZAXdpsYm8OvHTgJO9bMxO0MOACe08aCctxzBcI7s7iPL4nyfMPQQz82CJHGYDm3l0iRMIgpye2ToiscD4Y3Y5gGfI1XplBzcd+HEIPpZZnDwy4p6KhzUy4FBD+9AAQW4Agqsw9bkc0Pf9Es5hTo4k3jfuV/qdSlYfU6VtvOLPZDQMzaPadVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjL7q+I9Lyz6CohP7SSWS44qJcslnq/4wB66GQAUnyY=;
 b=r8PvpTRZW4sdii+dqBvVaCXlaQ0FB2rnHaXEJt2oMusa/ZjJcb/PVrDdkamHxTvQSGuwFrs/0KovW0GDZ3Ajpfh3xqskPhFBxmbf/2mOUDMHnhrSKo703QX5DvJ+u4bDDIh1q0iA/mHgB04hObK3yzDGtBqf2O6W6bGQzqZmKoGAWG1drKcHpKaTFApGSPW5TpCmD2jePRJe8c4Zaf17IT5bUUywZs5ClO7ob2Qf7mJX1FHFHQ7xTecShoZvY8ptJV2KcSuG2iIRZliela499H+D06Z4JRVY/PLxIus5NTfXbIwzKs1U3geogZzqFO3x28kEUTR+l26ggvBOKuNFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjL7q+I9Lyz6CohP7SSWS44qJcslnq/4wB66GQAUnyY=;
 b=uQet1YfiCgHh88pbwFAvV8GJB2LU9deeldZvpBKO9qBhzXf4SZ5bq/in0jEAgK7uiHph1IgMs7qLqPiUjoFnVolh/FRLkO2zHg6AhEdpiCHkiLFTS6Tksbmh8HTwMgrKxbRRmUmfi37/aeKfzzafCNU+FIuOrZQuFDBCjKgT0uc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH7PR10MB6036.namprd10.prod.outlook.com (2603:10b6:510:1fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 15:10:47 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 15:10:47 +0000
Date: Tue, 15 Jul 2025 11:10:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] provider, cg: add reject_clasue() callback
Message-ID: <aHZvdMdtZ2DU27TN@oracle.com>
References: <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87cya1wxlg.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cya1wxlg.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH7PR10MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: abaadc3e-7f5c-4efa-5e9f-08ddc3b1c70b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W3Z6nex0pqSWW9k4qZEAg3uAoZn3XHSmSH5lctBOfpWhey1MQhTsGYduDz3Z?=
 =?us-ascii?Q?P0mwpiL2PCCV5euAw4qw4AqdfYZztE6rWKVbxcLWUlhVfMnyg/fiEMgsnRO6?=
 =?us-ascii?Q?NGGsPlnPHhGCsqcsp2bwVHaTj9stlyzQ7Z/6zrMJDO9Dq4HXltnT2HKSnPhZ?=
 =?us-ascii?Q?nOdhqDdsQdj8KWV1vfzKS4A6cahYyOsxNJQxJN3Uijm94MhM8eovgY62eb1Q?=
 =?us-ascii?Q?hGKMM/9h0XompzhIdCETJnfgjSpAd3Rib9gHavGDa+3nfnOjSPEM3aPgUAj4?=
 =?us-ascii?Q?5bsJqTa69UV/AkwZj6FhxwHXqRyKtKBi90VLN9iCZAPeJMiafLZ4gcAxhYdF?=
 =?us-ascii?Q?OyC+lnKTgHS9nV2db2zDx7VYLkQDJnCl1qKYxTuvq678f6SW1MdYENPm2bQM?=
 =?us-ascii?Q?BP68zwWvQip6lkqdDF38EJGsIffGSNoaZ9PB3VUaanz1828atFiQCIoBG4Kq?=
 =?us-ascii?Q?G0f+Ppsr3JXRGR2Q5qAOarcsWHrJqktOCYLuBOsO8143fjWvpB4dFEZlBblG?=
 =?us-ascii?Q?kBx8XHxPIvsmjjyo+VbMIjN1oym8zKHzPAgyGO6M0i5/Gwd+XQG2Os3za+7j?=
 =?us-ascii?Q?USogVpA+SX7om3kUd1RaaZOYWhpSFwQrHuGhe+nXLF/GvYucAg43213dp4Ss?=
 =?us-ascii?Q?JW86fgSJEWFBSpkoFRK+BOtGXFIy1uhWIX5aJ0uEaYTlHlm3c7/wrhJyAJoY?=
 =?us-ascii?Q?vTazbb2pguv+afSND4yAz4P2Obu74hcosq5BxgoSBOm4AwEt9VPJT9H+GYXU?=
 =?us-ascii?Q?XXiCs4sHbdTlrgwLuCjb5wRk5j8CXpkaarE6Md8oGx34H/v2SvHWDLYFSlBw?=
 =?us-ascii?Q?w8dR7MTEGKq9K0RFAdfSsfh4hfORMGexrPTjRzbqwDMR4jXbEmh86kL1oM6Z?=
 =?us-ascii?Q?LiTO2X6Z3mEkfOmpWEWpuGq9bIZsdfYDwTuwiDULH0gK+CjBYUF49SxbcloQ?=
 =?us-ascii?Q?bWMadZiTfzRxfajJSqJMooi6mwqT44dQMY7FaZwcbjDtJsSGrxJw3c5cyouL?=
 =?us-ascii?Q?H13NRtY1yYpfhUf5pVtjXT0dk1m8DgjtFyk/PDfZthDx8MF1+Qa0obtxY6lv?=
 =?us-ascii?Q?pfoKVEdR1lYOWmbuyMMlUjDXtt2TtqtqF6nGLEhk5G5JqbTy8fx6Ntj+NYkl?=
 =?us-ascii?Q?8u/MLB4dqDVGlCnPgXuB90QArHfEo1upgU6CLN5IMnyEWtB5MsKI1yWEc+e0?=
 =?us-ascii?Q?rbvuUkUyTbM6TFP5cvdyO5kz8dVmWZqvsnbsreuEL6UuzO9SkNWOj0i6mynT?=
 =?us-ascii?Q?QoKchL6qcPVGXC+GsKZ9bKuSfMELFe9HOl63jD9pGDG+TRPaxnU/9MqvrFIf?=
 =?us-ascii?Q?QTNebvwl9NF2cENy3ODKG6Y0fZJb5qc57GRttlKVESAR4eLr09O59cYcbPa/?=
 =?us-ascii?Q?OLpVOZZFQBPcYPF7wABcKjpbYZgnAa5wPoAdHdIDSPRxH23MaUzcwjkM1UKI?=
 =?us-ascii?Q?le+ScoFSA4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AyDBOWpSPvKnXvjSZZq/2ByvxfeGYIvvPIOLU7jipfq1cZoY5DPzfQ88gD3S?=
 =?us-ascii?Q?3g2zPcTUF7UWKrNdqQT/X60p1I3pYa2UnRsbRj/E6xfNaOUZGVCkPNX013Ga?=
 =?us-ascii?Q?8QletMWKW1UgtGszD6HXl1TI6HUnFfMlXtQUWqMegHWlUdslcE43uNpkH6Vn?=
 =?us-ascii?Q?DjTDSb99WIanxbRVwoHl5T78R/DGtKNloazRaaqjonRrApLjlBRYB12OWMUp?=
 =?us-ascii?Q?ttonPd4T3AxycIF24YmayM6MnHlNv7zQ+4J6on0UeSJnWK5b0Axvzvk5XR/6?=
 =?us-ascii?Q?3LQvp74DuPfYnaifcrP54mm8cXmlzKdEECLuy+9vPz9fn4aDWj7SvPGCrU5W?=
 =?us-ascii?Q?drp1tr6UCwPAzpArqzvUcmtUbaiq52K84j+txuz/ofoOW9iRuwWTrPlKJHaI?=
 =?us-ascii?Q?C8/tGwZa20G0cz0zPdjWfRwPmB127uOewMENE6Wl79Uq2Br5wlFYOn4osjr0?=
 =?us-ascii?Q?wev8uwNkdTcixLSK0Xyusq1MVLvp3EBDnZxxjmVd9jRbnX6+9aV0KdD3u+ol?=
 =?us-ascii?Q?7vv8M1D2kBuLKBPeGxKtvX8KgzUkWN95PpL/XmrV3HF67+HGUWgsI+UlsOQA?=
 =?us-ascii?Q?JavgFF18ufm5KH0vaL0lpbQ03Sq15wwF3X1fE3A0AsI9BeKZXtSxm22I3PXe?=
 =?us-ascii?Q?3LjprSMtRPOUj6WLTNKL7w9JiM2K9g8GhuXir3EtzTz6Rb3LB6/Ysv9Tk42I?=
 =?us-ascii?Q?Xcruu1P9Uwq58zJIMG4+naYtTbxSqd1B24QkVeRglv6OvqOLeFftzjDg59Pk?=
 =?us-ascii?Q?/OdFxl8c8XfQAaM3CPOXX6u95PYGbv8M/KYL2HefSaWKT2ykLdKdBfzTUKEo?=
 =?us-ascii?Q?Z2DX9sVTvnRWDPr6bThsKuZ4Z0lyk8BPb0eL2FQffDnD3vRvdXJqVGH7jO79?=
 =?us-ascii?Q?Y3DrPlg/+7QJMo4ynj4fTCWg1q62loxBFNA9DOQkJZVceY7wof4cWIJR2zBh?=
 =?us-ascii?Q?bK8MwdxOGjZU8X7dPF0N+N0hTMhfOh33oHKndrDw8qHHct2ZggYqcRWnK4lb?=
 =?us-ascii?Q?XV0IGOGpb++0DUYTyzoSzpLUosD2Vswn9zDiZstQIWpLV9ewCVoHQbsUHmjE?=
 =?us-ascii?Q?c3V0loOGeC2aE3dBHfra3zgwt+OJn4fzq1YLGGH37uFp00YBrxF2P2cPm0QN?=
 =?us-ascii?Q?UGT2nBtHyBCCVhpwPCWItp7tkZynvLNWp1N9n/31j57Kwm/MQZLAdIJ3FZ4x?=
 =?us-ascii?Q?Ar76LfAqefTa2yExUuHq9N40bMumhxaS+TSWt3wTzFQT1sSeZPcU+qFPVJ9S?=
 =?us-ascii?Q?k/9D59xm3Kzz6wzKbvYl7BjKYOEkHubpn3jBzY3UK6f2f9H9jSyJCZjYw+q0?=
 =?us-ascii?Q?PdLsmMTVWW6Hcstt66lim8cmTbejE2XS3BDBtDegpZuIUnjFWo4PMXhspkf7?=
 =?us-ascii?Q?BjgU0X8q7sg+aIySes0Z0SuXWrP377hih14cJGnUrYKsyhJG4PpcG5bE0NP1?=
 =?us-ascii?Q?N23vac9MioUai+hs0hgDO5xFgJUcr5krep19RL+7fB7T7HeVSkFG2yyDUf0U?=
 =?us-ascii?Q?oiP1G0DGYHKb68gmPiXmHZEgLiP7AgD4ponQXw80Q/R8l4haPXR5d6b0hAQi?=
 =?us-ascii?Q?FCBPkN5CxjjBWfZcluxhErDZN7H3szx4yB0VAcJb2W8TPskyOUugPSVSFMVq?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NBLA4ym0EROjVZ6bmISIwbS4+Wx5fhWY7zONJEs8OKCg7DbA+XVFbiue9A5I8K6JwqLr62ChKSu1dAR+Z1bWAJVXlUrhuKPJA/apcamcYPJIsTYJMT7sHJA3TtdViiSmCgIaf76ZuNw2G9QDL2n107hWb7K/d+Uq9Z5R0xoHN4kUh2kIBOQaX/BKQN+ksYHfJ5jrwO4OBHLp4uWEU9ZzfLmKdiGhJ1tcqoOpEI+S5tV32xKbqFB0z3qxBKDoH3XzPcoXMFSrR1fsnN/7yIRraTjd8EzLnqryCZ6mfxqi1tFnwCK3QXHoTZLBiNfeCcZugqTCBuBT+aer94RePhYP8H1WXsZwRwKNs2BAeMRRhGcOQzl0GYIEMYgAkpWECeAt2PaClwiA04sBs+nXXEdoItqRDZ+C+eij7s8WjbGoquRAhn37sHo1JKgTAxX/AZ518LS6otUiqYAj8QVHclqEBSjaZoWvEIaHM6zvFF2RZdLRclvzzKmAg2wuYDmNaBQ45+mK7WVgdcDYaP8HBsI6amQmv4LdnwZQrls9dGHKWMtRSuU/YNycyui2wT7HNvpvmtfxLQAQY+MV61Y551ARTxBonIGCev7UBTuQhKl0tqE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abaadc3e-7f5c-4efa-5e9f-08ddc3b1c70b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:10:47.3365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEoeYBRY7GtCR3MXfT9GEh902L9nk7pe48+wvSpXpUpaHz87nGKyxeRLtBzToB1uWXojDl9rK2fTXF4StJ4xz8dPBOAcmk6HNfeZ9Qzbnyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXwYRGjSXEhjFR lFgqA7ASzDABzUi5PfPNbs4SUw8zn/TZF8Ug0WTMHwA9Uje3k+DIYnRa0p+1J77IMHzHKVOCCaz vUq7hmYNHAGPa1yOOFK29jytdSQnGP0Wqjw5sxDPM2sh5kP9jipLdGJcDK+NKITvA8PuMecqBFg
 vAz4AiW1r2jkDoPpv5bwV7W+OY7wAdQqp2RhWg0IUe99kf02Y2hgv/hXmvL9fU+Rc+s724sN2JI VM1DlCmYHQDXyvoV93x2MpNbmPNyw3ge7Sklaftr0oGQrv91VeLNm1aQgPjjiYH1cw/A6ZZA0Jf 6l9U909NwOYe/KNXdPkPP53s0wwAuWzgZ+T9zKqoyvlGq6AHQbUq2J+UsJTP/nQTP7Fz8DkpAyo
 x13Be0Rwzj5NWGfMsBjKTrtGBoa9xMRsdY4frJcO6hULkQcqLTgzM2EVIgfQ2zxVnShAunz0
X-Proofpoint-GUID: riYTl6dYl6Ms_TFe-VuN7TdzCwYnhCOC
X-Proofpoint-ORIG-GUID: riYTl6dYl6Ms_TFe-VuN7TdzCwYnhCOC
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=68766f7c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=UBVT0MKw4R0BZ7MO-AoA:9 a=CjuIK1q_8ugA:10

On Tue, Jul 15, 2025 at 11:35:23AM +0100, Nick Alcock wrote:
> On 15 Jul 2025, Kris Van Hees spake thusly:
> 
> > Future providers will require functionality to determine whether a
> > clause for one of its probes needs to be rejected for some reason.
> > 
> > Since the callback is invoked during trampoline creation, rejection
> > must result in a compilation error.  The callback is responsible for
> > this.  If it returns, the clause is accepted.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> modulo the comment nit below.
> 
> > +	/*
> > +	 * Ensure the clause is valid for the probe.  Call the reject_clause()
> > +	 * hook if defined, otherwise apply default checks.  Rejection of the
> > +	 * clause must be reported as a compilation error.
> > +	 */
> > +	if (prp->prov->impl->reject_clause != NULL)
> > +		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
> 
> This change applies default checks *and* the reject_clause() checks, if
> any, not one or the other.

Well, actually, the comment needs updating because with this patch there is
no default yet.
