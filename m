Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A71A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466768; cv=fail; b=t6hd9WZZpuJtNlAAo86fIjp68XEE5zVsFWVWhl9I4yaZwyTGnTP6sYxjcZSDU946Cjv57juzqDfp7ayCwc4/Cew14SAfxuzZYNcAwjAfj2n3xkpUjSNPXVy9k9nrkSTPdFlow0Qac+9Dry2LvFqC8IrlSTklIAAGFvMdLbldmc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466768; c=relaxed/simple;
	bh=vYqEDurM6+kLrh1Vhl4QcM3W3nmZvF/qcJTSymLoHss=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XClngsLLcAU1Gi2h8jKNAMlALjU2oce/IfIV4M4hk513VE7DiAuiHrahwXUcz/Rfx9li3sJuvoF9u8w0CRYhGj2wI+Ln9xA+Rge130Ti9OaoncQf5jXF2GaLxkW36DWj5b+HSPw4Q+45rDjAGPoD+LLtRDpW/dZ8vv4s/sRlcsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dN/C+bZw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dL2d5dUM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dN/C+bZw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dL2d5dUM"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLN0Cu031522
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=7BtPeZjBDxMstI
	HC4L6Iy19SwM5kXjR0jlz+liG7xMI=; b=dN/C+bZwyIiVg7BDCzZ5uFMJE0EBNr
	CMjq81D6kYO/wnkRjG8KGuRS5GLvJ+2tlCPcGhCvKt/LqXwJpdgTzrIET4t3vsw0
	zMgcrN0CzWyb4ba+vg7DB5ra01FxJgcA6dWh9vEMiuYxKMoj2dINCQ3yBArnrJPA
	0GuEPSTd+GeSxn6XzDKdFwm4LBGVzKlQHjufJVAvgVq5PvBbjtkTWpQpoqAfjzT1
	7Xbk5//xQrz2t6q6Zm8ycCLFbgK8ENfZtW2CV9qpCiIx2Kf6q8ISVAhqmd8Le+cC
	sguj7tmPdnV30z1WCbGWmFYorS4R+6ae/hkHi7dRcjP7phOt0/ZjIcig==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3owp7021479
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yxys6uwj7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLkcOQ/qy5/8oe6/IenxdmRt2FfpbofUqxEGIFaQ6KEvNRKekbr46PkYzt40YdyiHKPwD+2NHywY6y6OnNsc6RQqR3gEngELCT8ArNI1zQUatm7uAnzcf7oH/n+W8xIVNZLT++QgJpJHOZhHZUws/S6xyG322NvZGoo3gVZpUSgDfiEPgN0GjjxAfboVpeUDIjwasnysY+p5oiet0PDTwLKJv1ogz05Gv4oqtMbpcFThZizAQ9c10ARwREvBVjiRzLdVb9RCHpwMVWEW2KQHXDS2SeE5gYtnMcUEgIOvjkrZNdm2Mj0AGPn5PB9GYZ41NoZ0mAFMz2lC7/6s4WUfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BtPeZjBDxMstIHC4L6Iy19SwM5kXjR0jlz+liG7xMI=;
 b=nh/vGerd5gYQwh6UbQq8FgIIu0+5az3s77UZqDPpOBrc900JsYy+o9wcOykiqtu+PpDohQvao0+DQheMDNJ2GVMFVKwT8WDY5rmNe4W3HYH0C3VOBEHe79KpBxfswUHif1nw1rIRk++5OsOjM8HE71n0NYPJU5DX9styiAUYRo+ETGTTwCplhk7ZGmT1UcLS5UcW9rE2krDrGqkUE4JkdGvdZL0WOwx7QZggHhNQj8BRUVT7X70sXcYpNPPo+/08SIU1G3Y7Gf1vEZqxJCVX40MKhygpwJWyLDYnGeSxMZ14w6WiwtJnrdcO4gvrZV3ofhDvFhNpMbVsAFM0l6L6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BtPeZjBDxMstIHC4L6Iy19SwM5kXjR0jlz+liG7xMI=;
 b=dL2d5dUMiKktVKu+sSBcDSCgLTgQ6mfQBeziqdPG2FM/fXTOX9yqCPdrF44NU7mSmIS6h9qphgcFmTOXg0WXrRmEevSigAoNFldQCyQD6XV3W7sxj/GJaQEyagxWoUDgDD8WQ8vny4opFcSS98c4/hEo6E/rmZ8L+YQJnNeGwf0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 25/38] test: Clean up tests still expecting obsolete "at DIF offset NN"
Date: Thu, 27 Jun 2024 01:38:51 -0400
Message-Id: <20240627053904.21996-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: f082ccd5-fef1-47ff-8c8b-08dc966b7d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9WnmekoYM6BbEy8nhVnZVVN3j1YlndKIcOloa2zTr64GfKMNfP263vec3shf?=
 =?us-ascii?Q?wV1zwAAJTxPZdMpYI+eYk4vuav5r8LvTnDU9UwJbaJ5EePra0epnfLG9heCG?=
 =?us-ascii?Q?gYr3HoaXmVK+/vaClmpKd+Os+Jd9hhhjwQA1cOvLVJTu4KwBcXH3xdlBNEXD?=
 =?us-ascii?Q?ERl7KcNxJtdXmP0tnX+Nvr/sE1z9SSoN+LEfAXQtor/y8wEIPQOF7Ae+VmLJ?=
 =?us-ascii?Q?eGZM2A7vqKFlGxlgRsJkoU9U4p6ERYIycTuyfFMJLC+DpQfnzwuBSAiq2Pc+?=
 =?us-ascii?Q?8mThapRoN2kSFcQ/8o/TuuYL78pdEDKY/6bI+q5rbbqxZZg6TQbULsinsBGM?=
 =?us-ascii?Q?MMA83xMNMQKlM2sMqBbuZZzO4Li6AX7oWUFOhQbntIZRxFu9DLQxKkzS/Ybi?=
 =?us-ascii?Q?rBcbr3hAOB1KM63fQ3zjVaCTTH2NnF92CbSryM9mllRB3h+fY6ZUsUAv2Nl9?=
 =?us-ascii?Q?L677h8rbcPVNsN9AC8YC8oKNnmYpIUFgy0a56J+DtezPgtMRbaSygNEIS/Th?=
 =?us-ascii?Q?+Mvfdde3bLLc5/MHAGh1stetcI/r+QBzGkPxrPgPYU4KzQn+BNXI+yopsJd4?=
 =?us-ascii?Q?lY5kelfJdUZFIymFCn59KKgFh7ypRn0NcB7ArorsyL4nSL2FxeamqD3DHrdh?=
 =?us-ascii?Q?r+PbEiJzkdw3RSrf+vGG9MZHoBbiuLINadF3QBxf9k2AgylYiFO7Kb3aNcuc?=
 =?us-ascii?Q?t6D5txcQM9uyA9DsBcFu/THQc8nlZRYWJ8sR6uvSl0BqiwavemW2uBGNTTj5?=
 =?us-ascii?Q?F8JH+moZiW/0gsvyGn9ZHvCw5dCOvnMtEl0IL1iPkWWpR74u/5/bwF94i5+D?=
 =?us-ascii?Q?6S0b25s8ZttkICP5b2FJ9q8pI6Pvim5tToVVxv+JKmdtBe4fd7K9eGeMx6VX?=
 =?us-ascii?Q?749pZIXKYVlDegth+ZVOABKEKLCau36Aav/iWQIDLkJtE5pnZNf98FA5ymvd?=
 =?us-ascii?Q?3kOy/VAh5IDtLbcwKy7Qy3VvaRd8vHyc6KrHVVs6zxnd9FxlsTnvJo2l0bLj?=
 =?us-ascii?Q?zm7MnaHEhiy6tctO4Od1YC25PfxFTqLlKilwwWr3yrhhwnmOoaS2PEtQGm0r?=
 =?us-ascii?Q?IAfS8nprqRy9C0oefnonb3Vz7nwz9BFUwlBA6IOYaqvtWlooWEP9O+0TpvUO?=
 =?us-ascii?Q?exFdCWiOq0ywtYkKQ8PaiqL0KmZpPvSLIaPfpH5Z/3CY6CA9bG1ouECVaKhH?=
 =?us-ascii?Q?cO0k4DMCSAgW4k49nQ7gw7suTH3E/UvUXJVQryTM3UcXgonokh/1HepcQ56q?=
 =?us-ascii?Q?1wyt2+1t7eHP40GY8x9mLem44wqpB3pOl2Z5MnGfuk93nkSw631TotruHyI/?=
 =?us-ascii?Q?UntpV7FNJTVW3YP12gkPuSWYdk0dNFN3aun/F+lwdoiYrMOvQSL4lv623l/u?=
 =?us-ascii?Q?bzN7NFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kc7dGHFG3wkl2RJfzhdmhx3jtOwa29Rj9Mw61sghxkTdODsK2/26qNzoCoVl?=
 =?us-ascii?Q?WH4+GD1OHQQhNNjQAerwhZ2GxIozzi4HPDsJc3dyCSGYPQ3Kde4GyIkDj6xn?=
 =?us-ascii?Q?m0ui7fBSPQwnKhtZJIr4ZmFioN49sPXDw1MkLe4u9pU0IKekEhnRVfQN05n3?=
 =?us-ascii?Q?hkQokW+ftwoO0rkeQ/5URHGAjyYAI79msn547sA2eW1zvR3YfD01HFtGTkXV?=
 =?us-ascii?Q?/Ot60vz3Hdrwj6iW6UvRsErhodzNmR72ERiMK5TJ6XaksHtvhCBYGfLeKmpA?=
 =?us-ascii?Q?eBFUn66UnhOpqoNKuNAWWzwCHeP4HuInWuRh3nzDKzmR3sNM/MavvTX9iocC?=
 =?us-ascii?Q?T2GnXEK3/KsSdX9o0dzty11/NlcQuQAZKRv54Kkh+HFmzq0MwUU8pIpV+iyP?=
 =?us-ascii?Q?1hv9m3rlWuspjEdYBMPsoRR+A2CTpY819yRDTWQzW3ueUUic+2z0wS4RBLKs?=
 =?us-ascii?Q?2rm4R03DNftRsTpRVATEq8Dkf9wkK7WXw5fvlHSBTOWkmyKGK/IXOQdo9vMT?=
 =?us-ascii?Q?8mWpAm+q5Lk8YsXkfi4ZnxCWhHhIt8dikhhFHYmAYtuyhoCixj2w6DDejcI4?=
 =?us-ascii?Q?Ty6mBtUaHHowq5YXGjMofG/9Yd+1NdF/p9WTEMDygxPHWjcmxXXi5Mk5wmg2?=
 =?us-ascii?Q?2pamulOMkTL/C71tbFQTea67cGFybxXMAS1ORoEEg2Wut8ufBNc2eLZEw98h?=
 =?us-ascii?Q?OkCTJ2mkz7d3zV9FQwV52u3opLBqexFtdei5WbxfqGXJNvBRLBKAZmHk8DzJ?=
 =?us-ascii?Q?YbscRevGHLdVeWkmFg503S970oeRFRAfqYftbRNYzd7arCq/X2WwF8QrpOcP?=
 =?us-ascii?Q?XOcniC16HyG4lEJo5obZFjEyTzrlWdiLy2KhRcou6ZQdXLxLZEr/tOv8HEuK?=
 =?us-ascii?Q?ZUUDS8sNy3UfN9tpJI0Fs29F7xEkgoUBWALLvUuBMfYirTjFgrOJ25wtM/Cy?=
 =?us-ascii?Q?aCp+TFQip/xB/0JS+D3dy4USeP0MXjbvkLhw70Dpu1kJBe1Yf1pB6uT+VKKK?=
 =?us-ascii?Q?FCzjMpw2rI3kbaLmcQPxjm9wnJSdjwGOkXtqJgqZDfbNVXPdr0+0acf7pRR5?=
 =?us-ascii?Q?S8S+pvXn12el59+GLOMqrJM79syaHalBGkKH4pKwp9QrwTVXadi+Y9Qjy1R3?=
 =?us-ascii?Q?90mBj8DUJ78UsH2r9v2XZSX4VusIhjSm+NBXWngI8ahySwaw+RHxfo6gsfw2?=
 =?us-ascii?Q?ko+dnaBy/uaZ13hR+9cOpadvIAcazlr2muQZ88rVWGahCafiVNDf440jTpYK?=
 =?us-ascii?Q?ENeJxI7epWh9Yis61XePDvsbDMmoNQxv+2ctHCOum2B8WP/ZS3rKYC4+ERqO?=
 =?us-ascii?Q?S3Z3TbZheHV0FtjGOWwwpa1QNB3ME+lro1PPA/uBmUyMskCZT8FZXPALNnuL?=
 =?us-ascii?Q?lQw52v7wcZU/gYOuMsyteJHq7ezsfPrmNVQ0vLkEyQiB40gYEqsN5aqganb2?=
 =?us-ascii?Q?9OsMh3Yvdr7WjILnX3TzDeEvxD8Rp23PywCGM4ZHvj7JQ7LOh31FcS8SHONj?=
 =?us-ascii?Q?ePqaNvr9+2MIYD3rw8Y6rLO7yZz0z7E2uBnQvTGXqw44TmrkMuN+IHcHhq9g?=
 =?us-ascii?Q?9lZIJeSIcmBImI0rBWvNipJE4rNwQKyQGExzVKoE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	70sTkdxuVQapi6y33wIodVW9zsdLkJZ75Qp4EbRiq9plBFAXGYwa0lGVR56TYGiNUw8fTFuiehHJp83L9fktdv+WyVzyaqIKN3DbP3uvia+rL2G1Wu4QEJr20+VjSOsG66FVk3ysSYyC5SwJD6G0kww1I834THlW/uE4Fgs/ZkQlUdth94MZsUlmVE3Dice8R56HGxEUNPdiY0Na4hGyzmGmvYVEd5rpOokOmmbDJbAG3KuDhptCmvo8XoO9k/6c/00eqkbIfWnywQFAP28X3Roo9zzPoUX2nmgh4T8tp+Lyd2GGSZAeG2zTnhVKG5MIObNKSZD4YtozYLcOrYPC4cfh19k3j0dd18eqROU/6HFDv5kfD+6hDC5uFhs0B+b/bCOvLZhySH0sOyfyDVlj2sjdUIN59iFPcHuGiC2xv/jrCbZhOz999E8HLYrBuHbdd5hLgX5YWskdol6eQOqeC3dMhmNjS1gOEnoGT0i9JKOBHorHdd9GdrEcUGrO7IQIS95aeoJBF4CGVzvp1BQ/iej1MbAVmQ5i3cs4H2yQvzTnKiAijQBB5LdRB77uLCn9/x9tEsUA373Ly8NzhtBw/9YaElcVnszjWwbYjuocIZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f082ccd5-fef1-47ff-8c8b-08dc966b7d0a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:18.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvx1u3gmi/H4AWWC5nSGJAadDDrlty5v7oJHotfGTF9lcrnLIkLIBSgByab2Y/J5p82z2E+y4/5o/3pb0U73vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: ns8OG1w68y-APx4B0xqYEt3igfEzxsRJ
X-Proofpoint-ORIG-GUID: ns8OG1w68y-APx4B0xqYEt3igfEzxsRJ

From: Eugene Loh <eugene.loh@oracle.com>

Also, the numbering of EPIDs has changed.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/demo/dtrace/error.d                                | 1 -
 test/demo/dtrace/error.r                                | 2 +-
 test/unittest/assocs/tst.invalidref.r                   | 4 ++--
 test/unittest/drops/drp.DTRACEDROP_DBLERROR.r           | 2 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d             | 1 -
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r             | 4 ++--
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r     | 5 -----
 test/unittest/pointers/err.BadAlign.d                   | 1 -
 test/unittest/pointers/err.BadAlign.r                   | 2 +-
 test/unittest/pointers/err.InvalidAddress2.d            | 1 -
 test/unittest/pointers/err.InvalidAddress2.r            | 2 +-
 test/unittest/pointers/err.InvalidAddress3.r            | 2 +-
 test/unittest/pointers/err.InvalidAddress4.d            | 1 -
 test/unittest/pointers/err.InvalidAddress4.r            | 2 +-
 test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d | 2 +-
 test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r | 4 ++--
 16 files changed, 13 insertions(+), 23 deletions(-)
 delete mode 100644 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r

diff --git a/test/demo/dtrace/error.d b/test/demo/dtrace/error.d
index 5700dd33..d55fb090 100644
--- a/test/demo/dtrace/error.d
+++ b/test/demo/dtrace/error.d
@@ -5,7 +5,6 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: none */
 
 BEGIN
diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
index d894776b..d3904f47 100644
--- a/test/demo/dtrace/error.r
+++ b/test/demo/dtrace/error.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/assocs/tst.invalidref.r b/test/unittest/assocs/tst.invalidref.r
index b050e436..20f131b4 100644
--- a/test/unittest/assocs/tst.invalidref.r
+++ b/test/unittest/assocs/tst.invalidref.r
@@ -1,4 +1,4 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
-dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
+dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
index 14654676..9fa54dd9 100644
--- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
+++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
@@ -4,4 +4,4 @@
 -- @@stderr --
 dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
 dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index bfc77bf5..c74762ae 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index 3e7caac4..1e4fdd64 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,5 +1,5 @@
-The arguments are 2 2 PC 1 64
+The arguments are 3 1 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
deleted file mode 100644
index 3944c138..00000000
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
+++ /dev/null
@@ -1,5 +0,0 @@
-The arguments are 2 2 4 1 0
-The value of arg4 = 0
-
--- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
diff --git a/test/unittest/pointers/err.BadAlign.d b/test/unittest/pointers/err.BadAlign.d
index cd4138ae..e859dd75 100644
--- a/test/unittest/pointers/err.BadAlign.d
+++ b/test/unittest/pointers/err.BadAlign.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: This test reproduces the alignment error.
diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
index 4328aac4..187543b6 100644
--- a/test/unittest/pointers/err.BadAlign.r
+++ b/test/unittest/pointers/err.BadAlign.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress2.d b/test/unittest/pointers/err.InvalidAddress2.d
index 682ad650..b22f08fb 100644
--- a/test/unittest/pointers/err.InvalidAddress2.d
+++ b/test/unittest/pointers/err.InvalidAddress2.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: D pointers do not allow invalid pointer accesses.
diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
index d866eae1..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress2.r
+++ b/test/unittest/pointers/err.InvalidAddress2.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress3.r b/test/unittest/pointers/err.InvalidAddress3.r
index 069ee1de..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress3.r
+++ b/test/unittest/pointers/err.InvalidAddress3.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress4.d b/test/unittest/pointers/err.InvalidAddress4.d
index 1e2b4f62..586cddf9 100644
--- a/test/unittest/pointers/err.InvalidAddress4.d
+++ b/test/unittest/pointers/err.InvalidAddress4.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: Demonstrating valid memory access.
diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
index d866eae1..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress4.r
+++ b/test/unittest/pointers/err.InvalidAddress4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
index c23f9503..13032f77 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 d_path */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index 8c601a43..54ffb47f 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,6 +1,6 @@
-The arguments are 2 1 28 1 24
+The arguments are 3 1 28 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 28 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
-- 
2.18.4

