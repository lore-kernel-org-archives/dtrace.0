Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433F223719
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588886; cv=fail; b=tX/AAuWW6yEIylmWRWod3kzjKoUVKn8TMv2YwHSOgdiLVKWpVbgklISZnngmuQrAI54xTmgJJJ3ptOFUAZX1Ys/2Ob3nTPHe+gspoZC8NQWX9SeR2VowHCA6eDBJvooOc/Xzeyb0q2zNGTtrr/mWf32b2OrfenoxCR5ymlfZJy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588886; c=relaxed/simple;
	bh=6zezr6JVTTf/Ay+SYdEXeBWnuGhZomybWmWCNKFzQtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e2reJahsr/fUlRAmm4X6QqOyre+ZexpO7APYLUnxyB9Jp63VeeITs+Ti2eCH+sC1qQIdSkPjshvtiJPs8EjS/47AOXkmkk9c0XKRwU3Vl7P5ye9jZQvnfj8bQSbUItcsEreCjKiQ7JR6p52yu3jv5LWB0WxULDA3/6v4Y4ZUhRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZYi7bt+G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qkFUc5cU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZYi7bt+G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qkFUc5cU"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QEtafT018299
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=bu74uF8xiPiCnPwiUl
	wKmWMA6E7Nbq5V0OcQjtI0upw=; b=ZYi7bt+GcuPmTaiWS98CH5/keqvzRJ2ZS1
	/2uaG1nugMPV613Rt/VWVO0jK3wAgSnsNKMtDw2bI0UfuMnZbs6zsowfKCy4S8FQ
	koY8wU1yLiewIYJnR/38/xvHwud8BHie81v1TTXXMTbeh6YTUb5bMvooRaiDzHNv
	2U+GnVh3PE1MPzh5/QW1FEupoHN1OI8k/QGRgxRdhM9Wc4p9dJNHYmgKnk1xmdZo
	g71OaVHcMn1QRpj1HkxtsNn/vDof/qPsHOVtvhRsKTY6u8trCx+94vQGOeuFUtmc
	uII5wsb6KMoz1yDIVjmHAIGTVS4B+SSfen1haDphAEtcszYSGRnw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psf1kpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:54:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51QFflGs024384
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:54:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51ayf84-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqIc0vpHDJ7a75s44mF1OcN/3idIf84PeHt5iukf0SOLunaY+37mOaAL6R3mEuN806vBlkqnqFzBr802LJL7ZftmADEm6nX3Wj+ZB/v+oIsNbd+wcOR+dh3KJNz+fwDDN/wxmwKpaeFLAM9f5Gd8lkj7Vci6YywWzpzgvqLIwx+W9WIoXujOOjl2X9H01xeMwEcxfSm9SpCyKpYq4s7Sx3VV/rU1cJLdMi7P2hDzIJWe1cBLeszm2KkeHtQWZznh4MCEovikaZf5Iol5VfFaLWmAz5vSRYX+Kk+carU60KxuJrH0dOny2B7WvuYTj1Suo+oItosNS5lm9QTlHQoccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu74uF8xiPiCnPwiUlwKmWMA6E7Nbq5V0OcQjtI0upw=;
 b=LbQoHQ3p7LnRiJZG4s1vfHEFzhurmZRzq5MMSEaTEfVzGmKnydh7OqmzUUfEnJisfYm6UrnxdXaZh1yyLmRH/55/le5wSx1jaTiStRXdeS4yHg9taCdR0PC8CaI4uql/gbedpbldRO5IjoHy61sIgwZ7BS0CV66nrIA6EskTuaRdlFxbyHfV0fXp2IXDdqy7qbSvoGskH7SX5ixjoMLr9v/Wq0R15Wf8584YoSAa/1Kbn4CGlTQTFFH2ZmmTvJTcGZ74FiAIhVt02zRU6IOxVbJvrhtL9JMo6D2kXrH/wdkZNPpNHm4x+FQ+omyxS9r1wg+3vV48dCxPXEMcPZVLzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu74uF8xiPiCnPwiUlwKmWMA6E7Nbq5V0OcQjtI0upw=;
 b=qkFUc5cU03m605OXyDMGB4LQVxeCmpKzX4E6Ohd6//D0yFmr02LK5mALQk++8aJ+mgsqz/c3BQ0gDtqGomqG1fK849ksZjat1rnaQ63LHYmH9gNo+ZSsurECUKYFAfUwdQR8A3C63YdV7Y3bZKy56aNWBKI8GNwKuzxDzQegQJE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BLAPR10MB5154.namprd10.prod.outlook.com (2603:10b6:208:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 16:54:40 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:54:40 +0000
Date: Wed, 26 Feb 2025 11:54:38 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Have tst.ucaller use a predictable
 trigger
Message-ID: <Z79HTr6hTGJmsRvU@oracle.com>
References: <20250110190306.12814-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110190306.12814-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BLAPR10MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: b9530512-12c6-49b4-f7c6-08dd568642ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0odr8tfpAFExlv35UHFicQuS2YYzCrVVfJfc6IuK0rdm0ybEQMg6zd3SxlDV?=
 =?us-ascii?Q?hF+jDH6FBQJtO0lwVOMHzUMXJ+F17F7fT8Fppz095YVecGB65jHEzKSOA9vX?=
 =?us-ascii?Q?tzaO0pKAEbnD6hA4mU+Ur1Gv2Z/Fiw84t1zDlKNlTnYMp/ZGwrPHXd3mjHhs?=
 =?us-ascii?Q?qSlKsfIvnZ6daplcBqPjobq6OgIUbFZe3HnxcfgL5ag8+WUPJ4BcxrmfmKrT?=
 =?us-ascii?Q?2kXYP3z7ihbSqpkRTaxEl3Y2aIRur6DO/kH+CZuiln2+ccjZUVnlYyXMYOfC?=
 =?us-ascii?Q?+poFCT5i3q66AXy0xQ/zvlNnagwnQ3orEod4UrIdMnKxbpOYvaN1gWNDicog?=
 =?us-ascii?Q?gSw+t2aO2uDpSBKHH+KsVsPvZ4rdIsLOJR9QxOVpCZMzW5TaS+dHVegaGBUp?=
 =?us-ascii?Q?uZvY4Mu1ebpricHcO7O66bOY88BIwdU6EicEEri6mXnsHTZCJGJWQSp7FyNi?=
 =?us-ascii?Q?UFEeszTX/pd+nHgE0GJkqmFwNf/6UK5gAP+BlKStvpp33HqxW4LGIPpD2ue9?=
 =?us-ascii?Q?0n27/J1Un9+LjTCyxzva7DGzLvy226T5T9QzilzKYAaTRBs2boe3P7GWpxkn?=
 =?us-ascii?Q?fmXD52jrNYXpwZKTktVDxMF1KkBrvLM9BOMqUphagdwU2xvM4gKIlURY8br5?=
 =?us-ascii?Q?rngUjEYZUTefytIMzr54w3nrhuoq4TxgB9cMs06QFzQl4/l4lVqbugrKsxxY?=
 =?us-ascii?Q?2uXjIpmGvbRHOkP6B8jtSD9H9Zd+i5fv4oJPZmKXG6R+/6lkbU3fTL9j5n2w?=
 =?us-ascii?Q?yH+wq/HpRpB9fS6H7L5EBst03faBSetiXJMTjmNJqgsFxOhk30op9CFTtCpO?=
 =?us-ascii?Q?janO9L+d0CCodl9D/Fw8mS+UcAgB/hUb4KVVPTJBAdCXkFQ5W9m2zYX8e7IQ?=
 =?us-ascii?Q?kvw3/VMmymc1PDdFyNm1SfqhsLKu2WjCVphcSBgquu9/FOiVZe7ZbuZLXr3Y?=
 =?us-ascii?Q?5Min44PdGMBDSaT0zLlNKnsOJ20ispquxnMLP22c0nnW6uVrpP7IAe5jlT+7?=
 =?us-ascii?Q?TL4hquntzNsoA56DehAx0m21xSV0luPMwT78+lum1Ml1Zz/KtK6d779n1yCT?=
 =?us-ascii?Q?go9vEaRkTMFTFKqNrxfFbzhELwrdx2Ydm4TuaR+n/TZ9+aXAlUrOKJ1zhzxg?=
 =?us-ascii?Q?jAG+yLWSMOFGs9jrbbGGgXdlwWJsXTWrdeV8PNHHij5KSQGlaGK/FqbgE+A5?=
 =?us-ascii?Q?8vIlDNiHtrOjAD+u8wmtmNTnJt7n84+Z5lJtFN2WSfbgvjME7/UcJtgsKLWd?=
 =?us-ascii?Q?SURTWpQh/a7vzrbFuAeHsKDx3D4D4bJQOVmzP6eUt9YK+QnEEPmpIOcwKYf7?=
 =?us-ascii?Q?UWJsrD5MG1P+fHq9+L7I/J69QhAqLwvo0pqvENlQ2qx3iQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EJuv2p7pm/zwySOn1ivAK5DZBnafR3ZBqNhtVPjj57H1pc3C2MOZ5wtGcTV/?=
 =?us-ascii?Q?xV9jQx457ta7i5BGQt3fZW3GPkGkOWkizBXtn33zPDnbILLX8ncdiWKTsf2J?=
 =?us-ascii?Q?vxFO6KN6Qo88tNWPIGzR/ssQB+06akoNmRCi9Urn/w+zqbGD72yNelHv01uf?=
 =?us-ascii?Q?Cs1Kp8gg4PhJZoUqt+PIpd67I1LwcIejrlEd5WIoko818vL/dpui2VQgSUkK?=
 =?us-ascii?Q?tzn9lFR2Lcc+evBhmtY8oeoCrqOjDreqXw6RN1+QtHnzp+kCY1JppiE4keGq?=
 =?us-ascii?Q?X/bsF4ZY+nVJtlUxYVBosNuglhz7dyvAJKV8a0Op6zDJmkLQSfYyG8IdUsH1?=
 =?us-ascii?Q?1JMjatAEoQxyZqVtQ0D3RiAZ0E4fu6jyrCq2Rgc1hZO114eKpawyrdcZ+WN3?=
 =?us-ascii?Q?T7Bx9jYMQuff67J6RpqMaNLJVDxZvjziFr9lJEtu3tyd33+3wKpVG0AgbO7g?=
 =?us-ascii?Q?QgGhS7K9Nqh7DQicr457flIXZSyLr6IAlQVmfcx+BCmrlgj8FQKMaefcXJCi?=
 =?us-ascii?Q?Ustn+siZT2DTD8xFWCh3dvyIO/IZxNb8df8G7IoNvS2GaxFIgBlnsKtO+Zdy?=
 =?us-ascii?Q?IFqE5zdMqHqepcS4fIkqN0QF44zqDw/tlOs8Al5OLId78FezKm4r8IPR31mP?=
 =?us-ascii?Q?UkTZZ0YParwtBARJe56FChUJG/LLeT6cg1wtklQMYrUqehftUh+Ga5H97ytP?=
 =?us-ascii?Q?wt2rZwiqoFJV5NAOtLKCjDbTM9vjAHcqNbPaG0mZgApivkMMOqvsK7ahY+qs?=
 =?us-ascii?Q?8vB/Gw0hQJz7SAW2L5YEZFXuNamEGN2zITbs5N6X3M+d1ILsArvV1oKGw7xz?=
 =?us-ascii?Q?ZNnn+FlhtbLYGTpZ7Taoh6yDEUuOELLb04PYstEHE8dMPj89dqDgFjg9ldkF?=
 =?us-ascii?Q?9no+SzkMxLsJAM75r4E2o5wOtW+P3klo3k0UOgM2tJmYQ+C7dx6CoM6v/IzJ?=
 =?us-ascii?Q?UW7VvVMFrezgQbjAPs53vgseL4esj86IlCqnfe3FeSoqNNdSteEAznttI+ui?=
 =?us-ascii?Q?/fCzxRcCWYEh/Es0Cdj+PrpztdnDGA3pNFy0heQZ2Y8eTbyavUICibwGLcHs?=
 =?us-ascii?Q?MyWxY+UzMCIN8P/nKGWcjsGoWPx3CRv/uH73FKgtWt00u5cHn/U6l/FDnNFt?=
 =?us-ascii?Q?30Dd43wEzaf7Wtd/LqZqcsGYIkQkyhp5tamwVvGlzF9rxb5pkMq44SvMpjJ5?=
 =?us-ascii?Q?zFpLDiYPkGulo7DXivZ21Zje71sWqL8kiJ4d8YH2EOwLJSQuEZ/DLFMJvrqt?=
 =?us-ascii?Q?HCppzE6lF2fOUbOXUQWLConbFc7UKnLxZ7u2teUSPd8NwXFHKvNjVMxQ7isc?=
 =?us-ascii?Q?qtZgFdFgWY7XTVD0GhScg4soSWrt3HIkMMfPx21wo3po/9L3LkNVdRylAbkn?=
 =?us-ascii?Q?QFFNvn7pltPjdUjCr9a4aFe4HWOPahRxMaJEhPHMR2keayhwQEYBCoauqp0d?=
 =?us-ascii?Q?o40M2Fo0ni2m1sKWLHF61SLqL9LOiwtEsDr9Bc/2PjqLCellvXIKYotPyZR4?=
 =?us-ascii?Q?p5mGb8WC4A85rGckxRZqU/P6k36bj3JZuCUYLlaFwYXtsFIcekOe1/EnAds5?=
 =?us-ascii?Q?bYkBmV1aG+IfenoRCEflqt2cAG5F9VdzO8bo0Kwhhob5BggUzyLbg24kFkMg?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7MRjaoDdmhh483RoMkNASGnLgtIefu72BrBrECXrwfPEo8EQbJi0SQhJqsVtC6teKpMxVERrRhphSw3IXcGbjKT/RQkOF5pC1x4ABXzdqA0Yzp+PUdFvpaXygCtfT/jOVkTUoeu5swmBs3zAc+sFb227S8s08XFSdEMz1DAEMETI1nFByZ5C+m2h8rO5ijepa4ftxTRcK9JqbslApqHp1yRxV1ysjghA9z2eCIDLeU4kEG7ukvN/0faGQOzvsjeGtPK0WLWK7OK6qelC8cTwiRIIJ+qK5JS2u0TyBpfSjh8Y1CJMacMsBtB0T14A7bAIXmd8WPpiTvOSFeWXwaEKKpyQ88Qm4wETA2mkYTQw0tU3SPh5BODmJ3Et6A96pko4M6Bd5HRVK7ChsWTBuUPmW7GKRZopmDYKQn9yce2Jq/O74VcjbKTIE5lv3ACuuX6US8WGk78ljupwVl40PoB+nRjqYWUWRuEr3maXnE+DeCE9sjyj3KXqW+aq/UgS+j4VlAlKuCCFca5ixLLqzUYg5ZSAL07wOsP+OuqK5aAeYd1xIlUqEJAb5GtY+JFFroFj7GaMK+WkSvB7gcHD1V3BFDUSVTFNmH0fy9haPtxezNI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9530512-12c6-49b4-f7c6-08dd568642ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:54:40.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPrs3ZWLFBxEJs5/6I8iPDvqB2bgdG5+AIXcGW70fA1cuOKrsWm0tkqSDu5jYfVdKPxtnz0kgvplfvB0KZBSXE1mt/D5m5VS4O7bFmCgHOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5154
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502260134
X-Proofpoint-ORIG-GUID: lYEV81cbvnTg36Mys1-mKRtYgckWLaDi
X-Proofpoint-GUID: lYEV81cbvnTg36Mys1-mKRtYgckWLaDi

On Fri, Jan 10, 2025 at 02:03:06PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/vars/tst.ucaller.d  | 16 ++++++++++++
>  test/unittest/vars/tst.ucaller.r  |  2 +-
>  test/unittest/vars/tst.ucaller.sh | 42 -------------------------------
>  test/unittest/vars/tst.ucaller.x  |  1 -
>  4 files changed, 17 insertions(+), 44 deletions(-)
>  create mode 100644 test/unittest/vars/tst.ucaller.d
>  delete mode 100755 test/unittest/vars/tst.ucaller.sh
>  delete mode 120000 test/unittest/vars/tst.ucaller.x
> 
> diff --git a/test/unittest/vars/tst.ucaller.d b/test/unittest/vars/tst.ucaller.d
> new file mode 100644
> index 000000000..271297fef
> --- /dev/null
> +++ b/test/unittest/vars/tst.ucaller.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +#pragma D option quiet
> +
> +pid$target:a.out:myfunc_x:entry
> +{
> +        ufunc(ucaller);
> +        exit(0);
> +}
> diff --git a/test/unittest/vars/tst.ucaller.r b/test/unittest/vars/tst.ucaller.r
> index 9b09daa0c..bfcc80f4d 100644
> --- a/test/unittest/vars/tst.ucaller.r
> +++ b/test/unittest/vars/tst.ucaller.r
> @@ -1 +1 @@
> -  libc.so.6`strdup                                  
> +  ustack-tst-basic`myfunc_v                         
> diff --git a/test/unittest/vars/tst.ucaller.sh b/test/unittest/vars/tst.ucaller.sh
> deleted file mode 100755
> index a6376af46..000000000
> --- a/test/unittest/vars/tst.ucaller.sh
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -#!/bin/bash
> -#
> -# Oracle Linux DTrace.
> -# Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> -# Licensed under the Universal Permissive License v 1.0 as shown at
> -# http://oss.oracle.com/licenses/upl.
> -#
> -# This test is a bit naughty; it's assuming that libc.so has an implementation
> -# of strup(3), and that it's implemented in terms of the libc.so
> -# implementation of malloc(3).  If you're reading this comment because
> -# those assumptions have become false, please accept my apologies...
> -#
> -# @@xfail: dtv2
> -
> -if [ $# != 1 ]; then
> -	echo expected one argument: '<'dtrace-path'>'
> -	exit 2
> -fi
> -
> -dtrace=$1
> -
> -$dtrace $dt_flags -qs /dev/stdin -c "/bin/wc -l /dev/zero" <<EOF
> -pid\$target::strdup:entry
> -{
> -	self->strdup = 1;
> -}
> -
> -pid\$target:libc.so:malloc:entry
> -/self->strdup/
> -{
> -	ufunc(ucaller);
> -	exit(0);
> -}
> -
> -pid\$target::strdup:return
> -/self->strdup/
> -{
> -	self->strdup = 0;
> -}
> -EOF
> -
> -exit 0
> diff --git a/test/unittest/vars/tst.ucaller.x b/test/unittest/vars/tst.ucaller.x
> deleted file mode 120000
> index 6507ccd87..000000000
> --- a/test/unittest/vars/tst.ucaller.x
> +++ /dev/null
> @@ -1 +0,0 @@
> -../pid/test.x
> \ No newline at end of file
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
