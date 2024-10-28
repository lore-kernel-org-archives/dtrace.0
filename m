Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BFA1D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150314; cv=fail; b=kka6Mqu8RcpEuy9siriQTO8389Ni5WkW4DgLxSj4vunNdA1lRkh8HybQAwoUc/Pp5E5qQ4ULzp+6hbgiRj1i3SnJPhmEnNVwOwlImDuyecE3Y0oq/gI30C287DV/IcM4H/V6lLKT6669rGkzdW+PKu0fEtZAXrH4R5QsVs+Bk2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150314; c=relaxed/simple;
	bh=cuk2y2tc+mFYuQD+EXvEoAcaHzFp0Lh5Ss1KZItfXoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bq4IY8q+SwyATnCNKBXTqfYJ394JSWOfSzuTatDGpeK6bvqv2ycEWGQZOMF8l2U05QrBDfsOAKegokzXZJWgSfhJ5np6F2OnCYy+uF3JJVHQXoGtnmC7yQzuUo9tJVyxRsDlHdWHTUe4PmHEIHv/jhdHMUSmkUMVAtmU27JpPpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JeXGIFB5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aaDqi4GH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JeXGIFB5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aaDqi4GH"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaPE020939;
	Mon, 28 Oct 2024 21:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=7z6RRBWlMdwHDGREDRHTQllaVQBbj1Hhh+8LCcklnlI=; b=
	JeXGIFB5rntuyP5/rfj/xINglQL2d/W9/UxtRucNQEdtxQ3GYukog+uNNUz3F+fX
	hazPdee4Hj/NNc+9LqRbJKWk8J6NrDZ+fnaTQj8AMWV2BXKzIj6YfeGo+U1mIZvl
	9Pt70gnwN+DQkSntyfLQ7so5k9ePxuol7ezf80t6OZ0viPulD+HkTTfIhQc8gpWO
	ElQ9oMYPj9sdMEaipwldOWcKMuKEEYOo9vzPge2VJP9G15qLhm/lA/+ufQasX0tP
	S5Nbq4g9YACfh7+2Yt6ycrfiVQDj79n2pd14/Y8aT634LH3RHqSVRerSprRUSDUU
	6HEgszYrocm+CoSLSwkimg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKV2Y8011834;
	Mon, 28 Oct 2024 21:18:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnabe7hk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6saP1f3jQ1DWXHNYFeqAmrBXunG1A6HwbDpV1w7reNxnm8ZPHKmzdNA7LWMClJnlp+NEN0NdIhppXRzQ41oyYpEGioWP3ZVAXp9CQPp11uJGLbS+AQ8J68JkN/u5ZZNQDJi7e6XeVjPy3lhlH06qR2211o4xsIWQZS/hlZM0VViAGMEoOgmXijaPqLevh2YZqnvsBEYxtRbOp/xN6QGX+nZnp2tv/eeHiaaxv6+k4vh3KPQtqFSX5002dbNt4AutolyS2n42Ydw4OjWFoCKir2X6Ss4eJEgTpuS7corKbq9oxu+2gX90PL2UbBf3pJlQ5K/xf3QDpCbnYYCOJ/lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z6RRBWlMdwHDGREDRHTQllaVQBbj1Hhh+8LCcklnlI=;
 b=oGyVdLLAiIiPiE/DvAl4Cd7bX7j2stLwGmINDmlKa//SJGHhDLE6ZChZ79q63xsmlIw7NlEPha7Jr9NdwZxITbQO60KTHBEUmd78mQElSwHK08g/iY/lgcjDVW/6DFSHeBPyWyFhslGHLly9QX3bMdINMmVgxgfnSqMF3PpsuRaTuZMZXEBgTDuws5/bDWk31Y5yKsGP9QgkLrunq7EF1+UCiVaIpvwPsEGkzwQax+hl1AfSSlm7pOloHswS+R4T02AQD77UuAD8a7n4rbEoOUD5CddzapwFV5ouMhZJoFaI4UAiznK+PJ2Ep7AO7EmsPJrxFPeG4hpr+ZDKsW9Sgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z6RRBWlMdwHDGREDRHTQllaVQBbj1Hhh+8LCcklnlI=;
 b=aaDqi4GHcGuBMQmS/vI16fOz8ggu0Hdq0afNVyNVUVHSApR5UVJpq72rRrX46YkBJNwAXsuAAVz1/w7HZu/ChHTk+UdziEKvaToalNzdovX7suhEUMAlKVwyXHiguE/7KQvIb3F7Cvul1nu1hhYZZUYUGUOjlbhS/fQxH80ycks=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:26 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:26 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 09/14] man: drop blank lines
Date: Mon, 28 Oct 2024 21:17:58 +0000
Message-ID: <20241028211803.458685-10-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0032.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::13) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9b4bad-cc24-490f-fc4e-08dcf7961016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dw8rTm50GzqNNv0i+bv+bZq7+/smZAp+FFFokgy9vav8SVnE6D7XXczQxXQL?=
 =?us-ascii?Q?a2CSap0NrW8Sd61Cmi5BzrHYgO8RzOtnBHHrGgtGRJToCnpmwyZQevWjYekc?=
 =?us-ascii?Q?3pZhR400PJj/8dQ52Gpyw1yqDPjuOZnblJaxa9cO/WCQj1q8Fi2wWDdG5/Ii?=
 =?us-ascii?Q?i9kDlMgEXTcpD/JyRASeb8XqEXkjpL4zAK+qI2r+Q9x4diiT+nb2n4owOiaB?=
 =?us-ascii?Q?Eh5RK1s7w77KY/aBg2gyg+mFajMlb0Qf604FoJwpl/LFJ+UfhUMwy98mrOU5?=
 =?us-ascii?Q?ede/+bsBVI9zjeLdyiwh6LT8MQyupyzUiAPyIwWj63SX5lFMdbaPC4Io2leI?=
 =?us-ascii?Q?ixWQwdQU9kcx8Fj2KYVyl4HD2dhP6g63OHcjxXhn1g8OiQbz6AO6wcj+PGM/?=
 =?us-ascii?Q?/GKLvb/C4h6ieaNcAoQrUUIcMR6zxh8k4cZmwVM+VtsyzQCFhXCAdI9JLH6u?=
 =?us-ascii?Q?b0cMb/I7eFCBrCUGWSOAbEj51YDy4PzytLeblHBaYsZelQX/ciZ5ubSxdKeE?=
 =?us-ascii?Q?gaMn2R7jcAzyEw3o+uY63Ko1nNK3EhccmB30qln5bZjG9dUFEpbceTc8fn83?=
 =?us-ascii?Q?xmT8J0h0zPqo1DfCzRwkfauuEqI4M2rSO2WMgIQ8I30utiF981vZdbiEhH0E?=
 =?us-ascii?Q?fCv1i67tl9yylDgCjEjSlyMhkFcWXJXqiYlBGZJSONObPgNEvZD9QZ3YQCQn?=
 =?us-ascii?Q?fL4M83v1ortOWn1gyyvQDMzkS14hMO68j9POjTzfoxQ6GtMC3CD2mAkWFoCC?=
 =?us-ascii?Q?oC4Ko9KmyBms2wrY2wUJkEhTeoyC/5Z1hJSHZ+++EaZRoBTDbY7I6i18qxtD?=
 =?us-ascii?Q?kS2KL3GNCD5R9DBrbSD36i+NwDEiwEUmiOvXvdaCvqgZ0mAg9/hf7MUtN1Fa?=
 =?us-ascii?Q?gXZqr+D9W41Ol7FmuDkV/wDq4LIr2iEhsg/irARThbcOmdY1Jp3B5tc8u4eD?=
 =?us-ascii?Q?nuVqjj3NtTktsxtoj6Qp66nsrBrbPbagG8aOdxWVnr3CSu8kue5gUZ2zNQZI?=
 =?us-ascii?Q?T70aVb87rs1HRIkhkLUz53+a6ZjzOPNszWqv6J0LEbmWUah0iQBak2RcZlm0?=
 =?us-ascii?Q?23AYrCQkOENlC4JWQEyJ3LML6KiZ+ANDdjenmk0d3MipY0gKSDNdKTpCsw8z?=
 =?us-ascii?Q?DWirozEw8hs0zCXKrN1FoGG8KWNOC4nwLpn21F9a1EMbYXhpbuvedzf1upm0?=
 =?us-ascii?Q?ZU67iln56tk3bh+9GOlcJjyGPyLIoztwXBAlSDuUuOyXjRW83E3KvA/lQFha?=
 =?us-ascii?Q?ejX0dzmEkSsV1mp2iCXVfpD7RqzeJ1MoNRW45vrqlFxhC2Mw/6OQ3m6s2Ne0?=
 =?us-ascii?Q?mVQfo0bnsDr91B0aIDuNWzWH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9GhlV15wwMkmVWsTeArJIdbUzbPht1Kd5R83qgW3SPiw5VBFle3cCqUZpKyg?=
 =?us-ascii?Q?9RCE8ALR6ip5CTAaW1qVuY1YoKt+Jpoa2hyEWqqBNvwz8L7qikn35qxKris2?=
 =?us-ascii?Q?PXZf5uqgudbMAcTpksOm7vH6ZDfHtGp+dt1vQ5dlpDc6isWTB5Yona6HE8x3?=
 =?us-ascii?Q?+X5KWBIUyfJVSAmapnFZO7FENmPHsevdajmFT7uyV9xnI4ehDJhTIssxxYp5?=
 =?us-ascii?Q?rEO0hngKjeI+r40BebEk1gh3wTinwcGbUtRV6HBEiC8lcvizCJJkKJs6wG6J?=
 =?us-ascii?Q?62MSd3mUYC/Qo8a4IUovxncKdKIn5M818OoAV0jkSypVAhP09N1WnBM6xFS6?=
 =?us-ascii?Q?bA64N0Gfplv6wSVMIxfC4h7dU8W4AX6piYxsNDmz2wM1CHwS4am++/7n87OB?=
 =?us-ascii?Q?m4lMHwDD0wMQ6C+q3/gM+1aQ/IpFDUUGCl82rKH8Kfg0JgSaIhnUj/qrJByC?=
 =?us-ascii?Q?VBuXwc0rIuXbg9jXtqlyStAc6mw68iWYi5XSiWSmnOeT6I0r4w4am/9SNgbg?=
 =?us-ascii?Q?fOuJ6KvOP2Swzv4pV4xG1cIhdSPC1ouMbSmt+cIuuSQraGXE3eVi8hfTHcYU?=
 =?us-ascii?Q?TOxWJq2FhuH82QFa4eb2BsbLYwTc8yW1axLxPsUs/73G6I5jvf6Dq2moDCuY?=
 =?us-ascii?Q?FPfJeiWa+Lxv6SGva2nnxtmWen2ZGsrRdO3z5QhzwvRMq/x3SXkPAEAhf61B?=
 =?us-ascii?Q?EcTfEXu+yADWvpKeDsLLzr3hj5xS9APr266MzizI922XAcXniz6F1ubrjZdU?=
 =?us-ascii?Q?TEltQa2pgLdXutNc2Es9/J+4Uh7DLrrLSqozVjbjAoG18mhOXEfoDji8f8rg?=
 =?us-ascii?Q?Ygvs0NIe+frte07v9LhFvdhjCyWaV/FA0LNlZMi2XAgDpyuIaHedWNujGOih?=
 =?us-ascii?Q?DcH1dTROhaPkfnVUns8oSPh2L6gvbvtiCiZwp6MKKVxMp/TXaHVdH/McDMSV?=
 =?us-ascii?Q?8M6xNWMH+C92bTTO0vyoa7Tq/qosPQj2gJ1GRNZSPTgNsmrUMzFjCU+HQrn0?=
 =?us-ascii?Q?VlfKyi6CS14pXnQGcov5xmwaEaldopANOpUbZvQRQd6KB28dgtq3xuiCuuDH?=
 =?us-ascii?Q?pLZRUii2fpVZHgmnPiMhdo8Ex9YrcHoPQB9v1tAl6JFboceCK2dSwYno8s+N?=
 =?us-ascii?Q?Z1Vf2r46d6DndnItp+o4xjMWrzOiCmOJ4flxjayDlCIgaQX73PmTcxEcNHW8?=
 =?us-ascii?Q?OOACJbkJpmB6IyNrY2f+Yy+1qZvgpmFWmCg16zynqDOLsRhlyWS1+kDP3f2+?=
 =?us-ascii?Q?qO99FnmyrCaZvgm1LFS0m7G6NpxRO0Vl0K9JycKlECCoUtIPjfCHs85kBxl/?=
 =?us-ascii?Q?VjuI3XlEk6e1r66kf36Do0IH6I+OUaQZNq6BfttC+Fi4PCQEeN52y4yFB8VI?=
 =?us-ascii?Q?DY7aD8zO+7O/5J+nPDbqukXmQ5Wk4v6+pm2aLog012O3IMnsG6uTDdOCszZh?=
 =?us-ascii?Q?OTTAomaZB/T5kjiTcZLbBAKTncKswOEhszdXdEM0O8/WUGv9Q2G4rk433aB3?=
 =?us-ascii?Q?TCQpVqFJYwWVRv3jsPTva7d7dw9HRH+ttF1FX6zdo593+/sYVReUpIkelr0b?=
 =?us-ascii?Q?NcNwq25gY/+PtJDK2iEvVgUDl0Xt9Hq0i7uQzHaLKTybg0weiGN3DSFpiBM0?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fpI9k7MpLKPK9mdWovukCxnpCkj5qI2ez0iUszyqufIN5JDUUn7/gGt9jNCnm0cMmojP0J77HGuDs9VU5Lhng+eBA3lzy8P8xF8w8awREWgiPoNlkc1/vxK0Dudxt1lmqKrehQ3RLRDtzqaS8GyJg3V/mQLGYHt5r7V57TY7jvrVlu0KZyvx6ZXvzjZNWhedooYyDea9VzDJzxvxWn8ev9wMG8qszfcDa9wXA/5H2vob2MTc2BwbsJ+0ZyVzCfzEDohcZcpAOgaDvqYucHZsF4VsRtmEOsfms212OHtNkB8txyfPsTcAbGKmggk88bZSBeBvLRVL0hBE0TcyCYdrES3b1fdCLYv7tPYP/oecm8/UyRMwterOtlneTfVNOD8NG+/ex3Vl9mA2yd1LHK3Pt/aX7xfuR+bSs7JLdyTGZO5zkwikCQS5LA6jyPDXkIQnrltj7qHaUHsh+g2Qvpt05eRsSy6YwrZHjTsUlLuDtRL5baVXZujnOI7PEP4SozubXT/dl2tA1xWG47UbK7q0o8z+7tws4Fo7OF+YwOwgy1D2L7eTyQG/Z0R9OVOFCl1RmhdYDyIQadNe0sFYyiDtsPeKBmPaznMdcAJSyJH2jt4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9b4bad-cc24-490f-fc4e-08dcf7961016
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:26.7897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+k+5hBcfxhqjLIpSBJtXTcc5KXlGAePO+CTvUzI5ND/uxgfzrW0drFUf+YILd3Drjw29ls+ucQKLm1J+kWMEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: OrtsTJyZKfZpcFhuBvnINgKIe2cjFNMF
X-Proofpoint-GUID: OrtsTJyZKfZpcFhuBvnINgKIe2cjFNMF

They don't do what you might expect in troff: a leading . is preferable.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index a53632949e72..0639db2136a7 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -179,15 +179,15 @@ Print libdtrace debugging output on standard error.
 Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
-
+.
 Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
-
+.
 .SH SEE ALSO
 .BR cpp (1),
 .BR ssh (1)
 .LP
 .I Oracle Linux DTrace Guide
-
+.
 .SH USAGE
 .LP
 When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

