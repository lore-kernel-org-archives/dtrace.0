Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F778155352
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732131539; cv=fail; b=XVb9VbrDuJ6xyBb+X77WWVrv3sdV+xC0K+UB+u2WPHk6sWvqUjkSIVOdVSyMFtySyEIAHmaGSQLdh/bNpqcD+x0pzhePgU3ACtGjAaL5wgmx0CfHXyFpkTVR0wukU22S8cyWMpmdiwlKB2NynUmoJyAWTu+SDlsT6sN60dcyFZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732131539; c=relaxed/simple;
	bh=DNkNGYPX6bULtf1I6X4Okv+UFuXbCb0jz8weotgnv5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K5PVnABwG3ZQftqHJxsjkcp9k8VSR4sCRLeqU7sqCO2ycydtqvkNj3Lt6k3C9EfS59eu3PbnCMWQzPkTYD2VRSpS+WDuJc80FTjkfWZwyPLAbfPFv6ycifvuvvEWbzVz6Fm5iDtMahWkZZC93EyDmCt9VWMG6LBIhsTsFMviQYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GKJhGJye; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HwSt3jW5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GKJhGJye";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HwSt3jW5"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKFtZea026627
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=0zSk/6xvFx6N+Tyg8u
	eUhwJy+qmSrD/poOYtkRG3mHg=; b=GKJhGJye4Jzfp36t5geYEkUPWN66XMPk8N
	kBbQ8pDwOB2NLlF8R8TVFl3R5QLefma6Rm/83XQMT2EGuclVm7tkupTRF8eWCoGX
	BHpdas2Ysf6NOMoHEp3ioF9uLSxR8yVygQn3XNL9vtv1c1+fOk8XbtL2IwowO20b
	sn6lm4tXxRo3F1GBrmL4q4bDwpLEPQ4AKE1RSfptdnmVf2W0tRObM7wTsSteItdH
	MGcv+Fs0aJazj0oDWfBHKpXDVLShOt5yMImSckvCCZIUN/EiFMok9lPbYP7BrUhG
	mEd28dYNAVw1c+MwLyLp/754uYXBbuLdLulYju5OwCmIyownpyHQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xhtc87bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:38:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJ8F32008449
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:38:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhuakvhy-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbR1Tq0FM8zIUbnA2Tj/CvT5boVOybNq2x6dtySvGKO+7lOjRRC5cPtXiHBz9spheqns45JkznyPE5jNAjjaURsytFmOMkXN8blPyWCGDTF0USUa328yxiYLdgd7DvCiJPSnvBkx1ISycBTTMivcZmj0rXqx7WaocdXVxdxWDJ2bL+wulnXwsNEd2PebHqML/Edi2ijA+iCJz5r+XmqfH3iGc5IPQFthYjbic5sdlI448xMCAOTvRmj9Z0es5sKMl3r+uuoaIfKx8/pIap5wwVJOV+LuGWqiyr68UV3RAuSbAJPBzDlDqQiHPHkmzMpzaDgzSOXZm2GgpUvbAbVfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zSk/6xvFx6N+Tyg8ueUhwJy+qmSrD/poOYtkRG3mHg=;
 b=OfbyXBq9pOvQ7qOvXXyT6Wkru3fe8mD8RK88zh4CZp2lcpDPqXujG77v0hFX4WK8QSUz6gPvwSUGN8YlKbNqazrU6cvW7V9NoSURaby47V6cZ2ch80eaFUoYbxBjoL2gKbuinRUrn2tsqVUsrWsw/zIVwTA/4opqVbDVzCluIt2UjFlzKmkFA1/jI32vSmixUK05OGDwRmbeyTOcA75zQWV1PzvBuTK8lZq0XmaxFGRQ+2pzM3ZgJJXQa8md6YAzy78Zcl5KxyfuWXnr+3xq5s2xNPsxQzhiXLbLH8slKJuaaTBjUqq70d7LTyE/fCwX4/WQMnVxXVpzd005Nh8eAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zSk/6xvFx6N+Tyg8ueUhwJy+qmSrD/poOYtkRG3mHg=;
 b=HwSt3jW56N/wfS1Lhykc4MVWTk7I/tE8uJnoGdxx9ldVmN28KQyhvIPJd3+D+o+NBxcobii0pLlSLcWqdZMv8OTj0vs5x5nR8YO81RKfNUhpgbUWAODEsHjTBvVNkPL0l582MtR96V8HkQ5L/aL1vR8nLl/2YJqXUsjDr5cBNho=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by PH0PR10MB5548.namprd10.prod.outlook.com (2603:10b6:510:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 19:38:50 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 19:38:49 +0000
Date: Wed, 20 Nov 2024 14:38:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: stack_fbt
Message-ID: <Zz46wQyI22cZMdFU@oracle.com>
References: <20241107232841.28752-1-eugene.loh@oracle.com>
 <Zz43EAAB87FOttWG@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz43EAAB87FOttWG@oracle.com>
X-ClientProxiedBy: BL1PR13CA0449.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::34) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|PH0PR10MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c705fdc-e5e7-4f5d-d730-08dd099af2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sNJAF1XAaABCMBfaEz3/YKWnf2ns5LBmDL/Mhdr5rPwnJOLZPY7VASTcTaQO?=
 =?us-ascii?Q?Mx0g0Fpy+KGpf+clM124XswNNWhdIOsryCpNJheXHJDxoXJ5jyJzPwh9CHQK?=
 =?us-ascii?Q?TaYEla1OE4epGmyQBKgDtfznpXqqsRfxqK0BoyvAjRQ25jqH1jCuY+ovS09H?=
 =?us-ascii?Q?epG8AZYCxnuO878SqnqJAdnHmj+L/kqBRMlevHZ3+n9SZzEFwmtFV+azwFf/?=
 =?us-ascii?Q?wkcx94cRXrHjMblu2A+kGGOyUckSCzwldzxsIO7ep7WNXAmg5NcPXpzf8Xtq?=
 =?us-ascii?Q?443lakqszrtRHHus0t20Q6uJMps5TiBqVAAClkwsGLqJl+x0lekXsOeI4OWB?=
 =?us-ascii?Q?1t+pE397DvmRyJrCAUu3iRJOqUuDEFwIxjfzxko6A1rF3B19TTnvHK6zYGvR?=
 =?us-ascii?Q?3yT4ffXNAGwF8BXfhHZ/zD1lutZQHxe0bAdkBZmtg8WLFIONUt/22lOPSTqd?=
 =?us-ascii?Q?gWA+fk2FQuevo71q25OLUV7v6PvCnjp46qL68pSnMBlW+vKzJh4uPbQ2ZHt0?=
 =?us-ascii?Q?RiqBJPta42jqZfFLwRkPlz5qZr8uG8uf9ymGcH/oSkcc13v09kbSt42QWqnx?=
 =?us-ascii?Q?x9I4oE+hdoUrAHots9T0qXnlp9KdGfHtvjM3uTsdjJhocFSHtIq48S9+cBME?=
 =?us-ascii?Q?9sFYRm8GtJr2omZcnZQOCK+PvjkXkuev0XpDA1ieh8IjEqeuDgFEYN7kx3gx?=
 =?us-ascii?Q?LeYSq9exfzM7Rc1FzLksEPv35JvkXukZVUmU0pDuKBhi9AWbDBQr1oVeed7G?=
 =?us-ascii?Q?i+So3CFW4WOfgLEvmNx1YplXzP6pSpG/2/MnDWo44gBKhoRUCOmQ6I0PVQME?=
 =?us-ascii?Q?3VzLrXGN2hZndz2br0Jg7PUOZ85oWTaYeNtZlv2ep3Sd3ucfGWMulE40jKPz?=
 =?us-ascii?Q?4Vu+UlRHASkjJupNuvBhoLie7vR9n9YUdmusjnbD3HdN+DYf7v2QRTS0vlmH?=
 =?us-ascii?Q?WtVTGKrwXrzX1bWmostowNGKLvZCbRapkJKchrwY/vp40tBkmrEHmYednoQ0?=
 =?us-ascii?Q?VUXJr0LbnIwaayf6rVFNDR3BA5LbPKXOdoPe5MDM/E0aQtXKAhb3rEpxkLpx?=
 =?us-ascii?Q?iN1y+QtomM74Y40zooCcDA55SczGhiEThpsp4Tfsl8dCfUy2cMRLjJUCN7a7?=
 =?us-ascii?Q?fAUWTCUkupVNaWPmfdkfP6SaEnbT3Bt8A6Hqc+MhQMiFVtLFFqP78BS0CYls?=
 =?us-ascii?Q?49CrPOrWPRFFpKa9NZfJKGpqerLVIkLUHnl6JTBr/K0Eq1/uYiMBlXR9FLGm?=
 =?us-ascii?Q?uXs5kKjfiXIRRRqPjap/AxXVJ+DdZ+2AOjYefAbVCX/Xwp94z3JjCgncJfTh?=
 =?us-ascii?Q?sBYcn7UW7BwQCunYGB89lop4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6cVA+9EExa9iDrdxhpr5pWQxE4agHjDUsePAWOjz9N5NWAnO5ed43RJeFA2i?=
 =?us-ascii?Q?COxJsOQ92yIQiS0AJp4wKyEJVu/Mgnr03yChjQk47FpTbBhRS1ozFaDtzbHR?=
 =?us-ascii?Q?Jl51BSEF1Zhh4isMyFQWsYJbbv7667uwv+16Np1E6ZjeU7kK5anBeLxQ+4rj?=
 =?us-ascii?Q?3nw++LqDGfLBjTiBjEWcqxc5qhaISK8/7MsJX9R4GcGhqmiUTjeXcVomoBIR?=
 =?us-ascii?Q?be1aNciKj70ZLmzxiVwcXqEVCR/GmQNuaWrSQwUjBFeUYFjnhCMFki4K4mIj?=
 =?us-ascii?Q?6BwgCJATQojDMzx+9HhiyOYdOJlJyPmpDL1Yp49IbofRTnnV2HFVzAIRS0qi?=
 =?us-ascii?Q?ZVEn1mg5d2IJNYPDCZNqjje04AjgamNIy4jQ+gspUudHjyetLcDy6UPOp8Hc?=
 =?us-ascii?Q?3lHUmkPJyfKsTizUre49LB1TA6VudjdboX47Cv67JEqLgbDsv8jCpXTsElgH?=
 =?us-ascii?Q?YU26NdcXbNPbCa7sDxrJyDSfICw9EH1f2u9ag+rgLGNj3Xsrvd4sg32Cytqi?=
 =?us-ascii?Q?MKL/K2HQPMXdbrtQgPEpy9Av41MKTiLxjEwlacl4Q2WRqYhD1ZhTcllO6Fpd?=
 =?us-ascii?Q?D+5NlKtIB2eO7qHOhA4enbnp8I24pYcV0SP2JVDDmxq07AdAltzmozd3+qpt?=
 =?us-ascii?Q?QIuWo73P+YIgTWwO0uwb2UjY2vsEqqyQTed2msXOjuwwaf77IfCkE1q7obDj?=
 =?us-ascii?Q?75F58M/8fA+4Ms+YTNTWQQU0eLI7u2jIP4gA9FxIt4daPTfSg1GxHilDmjn0?=
 =?us-ascii?Q?T/wXgSzIpYmnIL3tj2h9mLjW3/Ef3mE97SDOSjHuhYmMfdQF2Sj0ymar103u?=
 =?us-ascii?Q?bFednudKknAntDkQ5KxVA8+lu6GPZboqqjYAokYdf5TSy4KgEeKoC3iXV2RW?=
 =?us-ascii?Q?PJto0sqcp8wb5pVMlHfXRuAD2W9EN5W1q+2MxWFFe6kAoOVhEu2/yDGMbeqI?=
 =?us-ascii?Q?eAUyFOn2gIPdiIH46xgT6+udHe2Eyujt7PCACukMW98K/rb8uTHJRCxzFtHo?=
 =?us-ascii?Q?de9/RXVgrRfG1ZCWCalwx1ToP+AD5DxBQzkIb3sQTXgKhXCM/vDBtYbKqfps?=
 =?us-ascii?Q?ueRvgW8Ej/D6WNYZLcl52o6LcLwrtQrDUTzFJt11tRNZ6EoZ7JooFgW7Q2+c?=
 =?us-ascii?Q?Ba82kvy/wSSU4PEAPlMnQL+A5Sh64UD7l3OXOWlX/XRr1guxtuGvjot3LJ2o?=
 =?us-ascii?Q?WWSJs7riaGkrYmC7MBXIfM0nFa/wI0c8M7mbPXnENGtTofpukJuBt1p+1it7?=
 =?us-ascii?Q?g8VkYnWfL8mQFhchSDGMDeOSY8sQn31CBFA6UAyiAeNXOfPahLMt9CVUbkXN?=
 =?us-ascii?Q?+o80tztLxJLsloeSxLolhOpsfzxJRxI+Gcdt9g7CZXW1dOCh8Nx9Ia5uhfHr?=
 =?us-ascii?Q?DM2bzxzHyanvAHG45u9i2eqbOmW4xL1JT24J0lhkAFRhS2jKjlBt4T/YbqKg?=
 =?us-ascii?Q?Gc6zSzmpPJmonWXCkHAsbYD1/qYFdjgfiFp5v1cKEw7GKVd0NDDaIr5stgyg?=
 =?us-ascii?Q?m7oIz9BlCLXqSloKiCwdNRldC9HM0azpAG1fo8z7+byIArh/A7P7H6Zfg+jN?=
 =?us-ascii?Q?DBuOmaa9DYJhN15F5sENgHu0ImXWI9FpaIN60vGKR0G4Wkn5SsVkA3O7uI0k?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mdCVPqufXJKGBlAnni8Do/OeHIeloYrThCcSDJLI+i/WWoGy92sJMRl3H2aFRoE/ckJk138EBr1AZLU64xeyKWLfyl9FzSWvOgWbhWYwnWxcMdi6yBtQiBkLvMuQJQ0Qro4RHbZ57i0BEY8xoGflbxhJLwXbEFqMQ3ISe9nnEl31SQbDofKki+MVLPFdIKftabfZiIYhh0/GTebjfQVN7qUjA6Ocrit6EyNZPZW0f9gkMtP6hgqzrCan4u21gT3Pe+qMyeyT8ufjEfiApOKINqtkamFgxghBgPHLKatk4/I1hedxaNg8QrmRm2Eu6iHLcwKdMwgXr3X0cZFYncDIBRFdVPjnfFGlVD7qwuh1eYkvEzbKkE7lp82JcwMSMDUPiasOsAqnCMlGMFeTxtxrR1vKLvE8mbZrLt90ounUn4uDjORM4CI+Hfa1bs6fh6V+JUtB+kAF5FPd1HaaW5rEx4XgQTjEPQQuqVxYBGSmYb9eAc4EAcwJQfalrWo7+x5qmr1bw8Sl+fMZdlauxy9HIswP5/ouAR/joEhO8Z3XvU2I9143/3fge4fmeg2PvXqWZR/LB6TyZJ/z+0oGnj+g7gtBl5H+ASXuGCUoMiPehzI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c705fdc-e5e7-4f5d-d730-08dd099af2a7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 19:38:46.7814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSxwqdp3ruDUl39kA91gre7jn9NHTMTTIeNrJt1n/v7rwL0ShdGHRq14gDd6Dbrv7hNrNQvyws7sOOesdDQbF+XzClEDpU4AFdkmcwFE56Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5548
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_16,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411200137
X-Proofpoint-GUID: OTcOKax0X96uJFaHQYxSZD_pBZajSOj4
X-Proofpoint-ORIG-GUID: OTcOKax0X96uJFaHQYxSZD_pBZajSOj4

On Wed, Nov 20, 2024 at 02:22:56PM -0500, Kris Van Hees wrote:
> On Thu, Nov 07, 2024 at 06:28:41PM -0500, eugene.loh--- via DTrace-devel wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > The test was being skipped on UEKR7 systems because __vfs_write
> > was no longer traceable.  The expected stack on UEKR6 x86_64 was
> > out of date.
> > 
> > Switch to fbt::vfs_write:entry.  Convert to a .sh test, so that
> > different stacks can be expected depending both on machine type
> > and release number.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> ... with small changes as shown below.

Also...  the full stack output comparison is riddled with issues because the
low level entry point handling for syscalls is an atrea that has changed a
lot and still changes.  E.g. this test fails now on a 6.8.8 upstream kernel
because of the following difference:

<               vmlinux`entry_SYSCALL_64+{ptr}
---
>               vmlinux`entry_SYSCALL_64_after_hwframe+{ptr}

Maybe it would be better to not bother trying to test the full stack trace
because it is bound to keep changing and we'll keep needing to update the
test to deal with various kernel versions.  After all, we do need to be able
to pass tests with upstream kernels also.

> > ---
> >  test/unittest/stack/tst.stack3_fbt.aarch64.r |  11 --
> >  test/unittest/stack/tst.stack3_fbt.d         |  25 ----
> >  test/unittest/stack/tst.stack3_fbt.x         |   1 -
> >  test/unittest/stack/tst.stack3_fbt.x86_64.r  |  11 --
> >  test/unittest/stack/tst.stack_fbt.aarch64.r  |  14 ---
> >  test/unittest/stack/tst.stack_fbt.d          |  25 ----
> >  test/unittest/stack/tst.stack_fbt.sh         | 122 +++++++++++++++++++
> >  test/unittest/stack/tst.stack_fbt.x          |  10 --
> >  test/unittest/stack/tst.stack_fbt.x86_64.r   |  13 --
> >  9 files changed, 122 insertions(+), 110 deletions(-)
> >  delete mode 100644 test/unittest/stack/tst.stack3_fbt.aarch64.r
> >  delete mode 100644 test/unittest/stack/tst.stack3_fbt.d
> >  delete mode 120000 test/unittest/stack/tst.stack3_fbt.x
> >  delete mode 100644 test/unittest/stack/tst.stack3_fbt.x86_64.r
> >  delete mode 100644 test/unittest/stack/tst.stack_fbt.aarch64.r
> >  delete mode 100644 test/unittest/stack/tst.stack_fbt.d
> >  create mode 100755 test/unittest/stack/tst.stack_fbt.sh
> >  delete mode 100755 test/unittest/stack/tst.stack_fbt.x
> >  delete mode 100644 test/unittest/stack/tst.stack_fbt.x86_64.r
> > 
> > diff --git a/test/unittest/stack/tst.stack3_fbt.aarch64.r b/test/unittest/stack/tst.stack3_fbt.aarch64.r
> > deleted file mode 100644
> > index 5c8bfaed2..000000000
> > --- a/test/unittest/stack/tst.stack3_fbt.aarch64.r
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -                   FUNCTION:NAME
> > -                          :BEGIN 
> > -               __vfs_write:entry 
> > -              vmlinux`__vfs_write
> > -              vmlinux`ksys_write+{ptr}
> > -              vmlinux`__arm64_sys_write+{ptr}
> > -
> > -
> > --- @@stderr --
> > -dtrace: script 'test/unittest/stack/tst.stack3_fbt.d' matched 2 probes
> > -dtrace: allowing destructive actions
> > diff --git a/test/unittest/stack/tst.stack3_fbt.d b/test/unittest/stack/tst.stack3_fbt.d
> > deleted file mode 100644
> > index 1a2eaf582..000000000
> > --- a/test/unittest/stack/tst.stack3_fbt.d
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace.
> > - * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -/*
> > - * ASSERTION: Test the stack action with depth 3.
> > - *
> > - * SECTION: Output Formatting/printf()
> > - */
> > -
> > -#pragma D option destructive
> > -
> > -BEGIN
> > -{
> > -	system("echo write something > /dev/null");
> > -}
> > -
> > -fbt::__vfs_write:entry
> > -{
> > -	stack(3);
> > -	exit(0);
> > -}
> > diff --git a/test/unittest/stack/tst.stack3_fbt.x b/test/unittest/stack/tst.stack3_fbt.x
> > deleted file mode 120000
> > index fe0d493c5..000000000
> > --- a/test/unittest/stack/tst.stack3_fbt.x
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -tst.stack_fbt.x
> > \ No newline at end of file
> > diff --git a/test/unittest/stack/tst.stack3_fbt.x86_64.r b/test/unittest/stack/tst.stack3_fbt.x86_64.r
> > deleted file mode 100644
> > index f24c8cba5..000000000
> > --- a/test/unittest/stack/tst.stack3_fbt.x86_64.r
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -                   FUNCTION:NAME
> > -                          :BEGIN 
> > -               __vfs_write:entry 
> > -              vmlinux`__vfs_write+{ptr}
> > -              vmlinux`ksys_write+{ptr}
> > -              vmlinux`__x64_sys_write+{ptr}
> > -
> > -
> > --- @@stderr --
> > -dtrace: script 'test/unittest/stack/tst.stack3_fbt.d' matched 2 probes
> > -dtrace: allowing destructive actions
> > diff --git a/test/unittest/stack/tst.stack_fbt.aarch64.r b/test/unittest/stack/tst.stack_fbt.aarch64.r
> > deleted file mode 100644
> > index 3a2896c48..000000000
> > --- a/test/unittest/stack/tst.stack_fbt.aarch64.r
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -                   FUNCTION:NAME
> > -                          :BEGIN 
> > -               __vfs_write:entry 
> > -              vmlinux`__vfs_write
> > -              vmlinux`ksys_write+{ptr}
> > -              vmlinux`__arm64_sys_write+{ptr}
> > -              vmlinux`el0_svc_common+{ptr}
> > -              vmlinux`el0_svc_handler+{ptr}
> > -              vmlinux`el0_svc+{ptr}
> > -
> > -
> > --- @@stderr --
> > -dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
> > -dtrace: allowing destructive actions
> > diff --git a/test/unittest/stack/tst.stack_fbt.d b/test/unittest/stack/tst.stack_fbt.d
> > deleted file mode 100644
> > index 27db21164..000000000
> > --- a/test/unittest/stack/tst.stack_fbt.d
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace.
> > - * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -/*
> > - * ASSERTION: Test the stack action with the default stack depth.
> > - *
> > - * SECTION: Output Formatting/printf()
> > - */
> > -
> > -#pragma D option destructive
> > -
> > -BEGIN
> > -{
> > -	system("echo write something > /dev/null");
> > -}
> > -
> > -fbt::__vfs_write:entry
> > -{
> > -	stack();
> > -	exit(0);
> > -}
> > diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> > new file mode 100755
> > index 000000000..e60c519c8
> > --- /dev/null
> > +++ b/test/unittest/stack/tst.stack_fbt.sh
> > @@ -0,0 +1,122 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +# This test verifies the nusdtprobes option.
> 
> Surely this is a copy'n'paste error and should be removed?  Or rather, it 
> should be replaced with a message that actually states what this test
> exercises/verifies?
> 
> Shall I make it:
> 
> 	Test the stack action with default stack depth and depth 3.
> 
> > +
> > +dtrace=$1
> > +
> > +# Set up test directory.
> > +
> > +DIRNAME=$tmpdir/stack_fbt.$$.$RANDOM
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +# Use DTrace to capture stack() at vfs_write:entry.
> > +
> > +$dtrace $dt_flags $nusdt -wqn '
> 
> I assume $nusdt should not be used here.
> 
> > +BEGIN
> > +{
> > +	system("echo write something > /dev/null");
> > +}
> > +
> > +fbt::vfs_write:entry
> > +{
> > +	stack();
> > +	printf("first 3 frames\n");
> > +	stack(3);
> > +	exit(0);
> > +}' >& dtrace.out
> > +
> > +if [ $? -ne 0 ]; then
> > +	echo ERROR: dtrace failed
> > +	cat dtrace.out
> > +	exit 1
> > +fi
> > +
> > +# Strip out blank lines and pointer values.
> > +
> > +awk 'NF != 0 { sub(/+0x[0-9a-f]*$/, "+{ptr}"); print }' dtrace.out > dtrace.post
> > +if [ $? -ne 0 ]; then
> > +	echo ERROR: awk failed
> > +	cat dtrace.out
> > +	exit 1
> > +fi
> > +
> > +# Figure out what stack to expect.
> > +
> > +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > +
> > +if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> > +	# up to 5.8
> > +	KERVER="A"
> > +else
> > +	# starting at 5.8
> > +	KERVER="B"
> > +fi
> > +
> > +if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
> > +cat << EOF > dtrace.cmp
> > +              vmlinux\`vfs_write+{ptr}
> > +              vmlinux\`__x64_sys_write+{ptr}
> > +              vmlinux\`x64_sys_call+{ptr}
> > +              vmlinux\`do_syscall_64+{ptr}
> > +              vmlinux\`entry_SYSCALL_64+{ptr}
> > +EOF
> > +elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
> > +cat << EOF > dtrace.cmp
> > +              vmlinux\`vfs_write
> > +              vmlinux\`__arm64_sys_write+{ptr}
> > +              vmlinux\`el0_svc_common+{ptr}
> > +              vmlinux\`el0_svc_handler+{ptr}
> > +              vmlinux\`el0_svc+{ptr}
> > +EOF
> > +elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
> > +cat << EOF > dtrace.cmp
> > +              vmlinux\`vfs_write+{ptr}
> > +              vmlinux\`ksys_write+{ptr}
> > +              vmlinux\`do_syscall_64+{ptr}
> > +              vmlinux\`entry_SYSCALL_64+{ptr}
> > +EOF
> > +elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
> > +cat << EOF > dtrace.cmp
> > +              vmlinux\`vfs_write
> > +              vmlinux\`__arm64_sys_write+{ptr}
> > +              vmlinux\`invoke_syscall+{ptr}
> > +              vmlinux\`el0_svc_common+{ptr}
> > +              vmlinux\`do_el0_svc+{ptr}
> > +              vmlinux\`el0_svc+{ptr}
> > +              vmlinux\`el0t_64_sync_handler+{ptr}
> > +              vmlinux\`el0t_64_sync+{ptr}
> > +EOF
> > +else
> > +	echo ERROR: unrecognized platform
> > +	uname -r
> > +	uname -m
> > +	exit 1
> > +fi
> > +
> > +# Add the first 3 frames a second time.
> > +
> > +head -3 dtrace.cmp > dtrace.tmp
> > +echo first 3 frames >> dtrace.cmp
> > +cat dtrace.tmp >> dtrace.cmp
> > +
> > +# Compare results.
> > +
> > +if ! diff -q dtrace.cmp dtrace.post; then
> > +	echo ERROR: results do not match
> > +	diff dtrace.cmp dtrace.post
> > +	echo "==== expect"
> > +	cat dtrace.cmp
> > +	echo "==== actual"
> > +	cat dtrace.out
> > +	exit 1
> > +fi
> > +
> > +echo success
> > +
> > +exit 0
> > diff --git a/test/unittest/stack/tst.stack_fbt.x b/test/unittest/stack/tst.stack_fbt.x
> > deleted file mode 100755
> > index 4561df8bb..000000000
> > --- a/test/unittest/stack/tst.stack_fbt.x
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -#!/bin/bash
> > -
> > -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > -
> > -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> > -	exit 0
> > -else
> > -	echo "Function __vfs_write no longer exists starting in 5.8"
> > -	exit 2
> > -fi
> > diff --git a/test/unittest/stack/tst.stack_fbt.x86_64.r b/test/unittest/stack/tst.stack_fbt.x86_64.r
> > deleted file mode 100644
> > index 792ce80ad..000000000
> > --- a/test/unittest/stack/tst.stack_fbt.x86_64.r
> > +++ /dev/null
> > @@ -1,13 +0,0 @@
> > -                   FUNCTION:NAME
> > -                          :BEGIN 
> > -               __vfs_write:entry 
> > -              vmlinux`__vfs_write+{ptr}
> > -              vmlinux`ksys_write+{ptr}
> > -              vmlinux`__x64_sys_write+{ptr}
> > -              vmlinux`do_syscall_64+{ptr}
> > -              vmlinux`entry_SYSCALL_64+{ptr}
> > -
> > -
> > --- @@stderr --
> > -dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
> > -dtrace: allowing destructive actions
> > -- 
> > 2.43.5
> > 
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
