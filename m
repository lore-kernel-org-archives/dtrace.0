Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE8616FF44
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754072381; cv=fail; b=Efvw3wG6I+eE5DsiXjFzmAhDS/PgJ94VjdCirde1Rt03cordMcAHUhHSjW4k6Oor5gCZnnrSp9X7GctPtO8Z1oA4yVYPfs5h96Yv/3mYcqNtsgGChuDcqAGi6B6EJgWX1CGBapSmqy5JuOteO3ICdHtfQCoNHvHpqBk720oIq8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754072381; c=relaxed/simple;
	bh=gyY14yizohgQ1I9nqPWjL6M/hfpPC4+IeHggxy9OLKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iW2hMRiDBNaHgto7ApSHV17RId9y9k7NhIHrfkqs7Ht0Hp53UlPzXIbR+o1cGXKtJBg/fwtX6ZmbNt/vwvS68lb8i7DlVeDSIfuDHiPiwA5Cb4/33KF9QrKVCxQYn3M1TfQ3YdHjK8mfrdkx4N8dX1O+21fbg8s1rfOXdhvGmb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=olrJcqQF; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PKnjI9Gm reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="olrJcqQF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PKnjI9Gm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HtunF010380
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lLD9pERRkg4GStJ0Xquz44RrKol3a71otd0RXDaRazI=; b=
	olrJcqQFn9iHxTche9fIEzf65SxUvgMENav0Lstue10UORmBM5MSNnofz2QHxIak
	RzNwTncPgEHNfZip6YWmuT0G5h3VUKgXAf1YcP4dDM/eTMT2MjA3ZgdUP7uraPCG
	FsUAsnn7UiX5q1Si1022N31ELWsXtIS7FSTQ0ZcbPPcxehKnPSp4Rly21+1rby6f
	DF8evP3bXFvMdd19ydBFSaB7xlOc7TB7UOxLUCsaxSKP1l/ur/77XFjd7h1yH6Xx
	wIaHf2Zn8AOEFsw9cIjIrl2UOgthXjc905VBPVG4RBFkzwT6ZzSlhab5BnBOLglN
	Xn1Fwjop42m76w3a9fRH7A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q29xwgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:19:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571HLRwL020374
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:19:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfmfkpx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:19:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du7W6rJzGdLYBOc9M/OYaNK+o0NzkGlFZggxm/gyXupqy1usHuUSJZ/Aoo+6Jtn4CjEiIH6MHoBqqpXtFFlvft1wKl4gkIKwEp/NB7zQbNa8bp9vQ331BJcBSwBgce98Vb39PmXQZUPrtVp1fzxbNwam7DG87gaJrhINMr2+dfVIcfF3Rtc04Qni//o69uJ1aouMmvpKNi9It7qpYN4WOd8D8miKGE/y/NtAD+TEAIn72AElINZXagSZnnHjWO6c/iT5aZ3F9qQpRolCZbgnCCbVu2/52qHkj7HgKmco62yeLOG8KnFYBTbtil/EYAcLBRPo86Amai2Hx+GoOBfAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSePfRbge0T387H4HbRSKA0brp4dyZkUUKMI1hK2CH4=;
 b=YY6x+u8jWp/3FpM3c68zkJF3yb70mF0hMTPbvrzvyyReCB15+u0dOR3rjUB0w0MgvxL6UBTxaUqd34mcP4L73fLAwcPl0V2SUAC/PmXkhsjW2Ejnp6i0VtT3d5Rpue9DLG/9inyjLTVSMsgsFTgLMMeLWeAsVQAAYrs5OtrrPNkTPNxDcfFxfknuGYWwnNkHIDFhhq68I2UXDm+GbGNNhvHz76Hfyh2OtHy8LKkKtckS6ELQ6TFoHEdgzh6K/4LZZKaHcIY86sMOiabXDX7gk6r76wnyTQ+4i4e6tXJ/fDaqdoUo8JBfQVthmjXY4jmW+umx49SrICaqkhA3KY5D0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSePfRbge0T387H4HbRSKA0brp4dyZkUUKMI1hK2CH4=;
 b=PKnjI9Gm2pf9JlU/5vagyUDcnr3E2DBgLSuL56zc2Seyy15eqSZe0DYFg2xzI5Kp9czPKJEo2R69JzZGWeqg3GiyAIxNnFUsRsZS7jNG5L/0dMp8NJlG0t+Hbp19jw5CjI1AMsU34BMssv0tNMK0cFsS6bbrCGX9lgx6FdayVck=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW5PR10MB5763.namprd10.prod.outlook.com (2603:10b6:303:19c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 18:19:09 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 18:19:09 +0000
Date: Fri, 1 Aug 2025 14:19:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Message-ID: <aI0FGgbkNNq6yyQu@oracle.com>
References: <20250711044024.1587-1-eugene.loh@oracle.com>
 <aIze8ZQ2iBFSf0J5@oracle.com>
 <aIz+I0xHukj6+lrL@oracle.com>
 <242f4ff5-c88b-ec46-de07-a6afc60936b9@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <242f4ff5-c88b-ec46-de07-a6afc60936b9@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW5PR10MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4f29a6-13ff-49a8-92b2-08ddd127e855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?qay0x3GauB5Ri9DyscYQSn+/yeFgqyxhulEhvMIhTeMcxfVoNqUXN5e6VL?=
 =?iso-8859-1?Q?7c3PaayVQ8jgCgzikx/SvjT8H6ZnoS86Rbpkvd/BEu2KU3AKaK/12MACe+?=
 =?iso-8859-1?Q?LhJzjmugsaYzQ3BpJh//CsoQGrkBW8lvRGu28QdO1qqz4KpMVST5r8JFGY?=
 =?iso-8859-1?Q?KWIa9Gz7WZExAD60UopNtnas6UDpnmVBFzhkTkQvdp9wL9N/wkffOcVpgB?=
 =?iso-8859-1?Q?ziUFKuaOnFt4V3wfhAa0lBayFBIDNwHTU77tJd61FpbY3QOjC2fwx3gQBg?=
 =?iso-8859-1?Q?gfo0NM0LXm4PCz13d+H6NTXxItpjIHByO9QE3/cUzD6DATWtbF/lQ17T9x?=
 =?iso-8859-1?Q?t8vyRXzT/5BzrSUSUBiKpqPKjytn+ynH5id2VggrOEr64HmWdllTwe6c0C?=
 =?iso-8859-1?Q?37V+AX/EI5nQxzqw3hlrRwZ2hfc5PEVbNbl1gXV/FPEDx4nXe150BHy6OI?=
 =?iso-8859-1?Q?d2reTLonXHK0oadp3OX5wNlh4k2UJ8CQVuDoNgFD8GDPFOeIu+pB3GJEqE?=
 =?iso-8859-1?Q?fiYIv6biBNb1mPPEt38owgqBn7NmSX+kGsOQDZ3ONYT5CpTNKvOQ8szfxQ?=
 =?iso-8859-1?Q?pRLnHBt/O5dhrcO1PgE2j1nXiwx8uIRyTCSQHvWAcETyPQiyYkFautpBn1?=
 =?iso-8859-1?Q?qkL9D0qThzRqe+vbQag3kEpqN6F09aV7H/ocI6B7Xa1K14E83CPL4u+BrP?=
 =?iso-8859-1?Q?MX1Beow4/rUlxYRXoWZYsLbiGXrZ061XExv7albU87+FUgUNHSfG3V42Ti?=
 =?iso-8859-1?Q?kUXA9Mkh5S+JWvHsxG6wmY4Yv4V9aclhplZM6uzvIw/K02k2z9H0Bh4+Mx?=
 =?iso-8859-1?Q?8fYzkAa1/z0DXgExoeOzY3kv7TtCjVJQvV8MC2dyNLWXLbjDVhEdfY3is1?=
 =?iso-8859-1?Q?XZYJNKnt++865fk5eDFE1nXIz/FQK1AJXBSM1U3gRJxndOzjRbm7dn41aL?=
 =?iso-8859-1?Q?tlDZziUlmFufjzmUlQuNwN+rVlP7j8uetqrhRrkVXmuc+7mdPg0BZIjSs5?=
 =?iso-8859-1?Q?Am5YeIiAls7P/0ARL68Y9ERnnc3cuZKmxWmhDZWrBxga2iosrCBRzj569I?=
 =?iso-8859-1?Q?m1zH0JbRFWx36Atxx7gg2k/TUdpQps20kZtW6mSEauZ8OQDisXe2x38Tiu?=
 =?iso-8859-1?Q?EjNmNo0QuYuxXcnGGMYkgWoXmrmol+Fq30XaEVozf1nKpgQZ4xzPiQAPAC?=
 =?iso-8859-1?Q?aAmyFdJZ4Esw/45eGBUj0Ww3Kbbx1a2/bPmTU3RkM431szHnyMkdQc6hJJ?=
 =?iso-8859-1?Q?RuvthS4FMf8B/aeUoBWPsDbAHmKntVDF4QiaZqo1gKLO5zfFGXkA5Yemp/?=
 =?iso-8859-1?Q?OnG0Np+1kOPYfBld+iXegj3EaHgC9RulGepbBoB0SFC6+gSVbA5frhQFq1?=
 =?iso-8859-1?Q?dc7wxVLy4GO7b7qm1Mslku38K3Z4K5CF1/AkEFEVZpmCBVzJgKAJp8N7mu?=
 =?iso-8859-1?Q?QQoSU6JjR9eFDx8PKaq4m2o9kOzOAUqG99DJFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?HQV6mx6nvHzpotqFopJ4OioLleL6di55iXi7CRRMlFjYaGHQKhG/feYCdB?=
 =?iso-8859-1?Q?SRgWJxBVcZ4T+4O0Hz3ESNlakq4NHg2bSscRxDHc8zSfhrixjUd7OXj/Tw?=
 =?iso-8859-1?Q?/Vco7Epn6p8f6xOt91hY7+Cf6fDa71rSFkniJriNB45spYzElqeI1ww5nO?=
 =?iso-8859-1?Q?Vhljei+mRcBr3rlkrQcYKN/mxjgqlpddgPZ5hNv3kuLf6X0BhtuJyi+fi9?=
 =?iso-8859-1?Q?z7CRL1HsYCDx5q+uc6TZxBRYA2btv9nrMdWjDf0bnu79CJjBSZCgpTTFf8?=
 =?iso-8859-1?Q?Z4JRhKgTbFluVi7GoKeA7/Fk742LozNpZGmaW82OktCjuLWFh6BoWUqFJb?=
 =?iso-8859-1?Q?wcbjLInW5GrWxJfP5Sk0SCWX0SSQSOPf0EZF8yA0Lj0zDCZ3m4A8b7NxYK?=
 =?iso-8859-1?Q?DLGvKSqhlrSiYP6XxccOBuPCl7wyp2HaY6ydrnDM3YBwLtB0qB2lrdsfOr?=
 =?iso-8859-1?Q?3OJGl5bPk9NwRcF00hyZIlWqMmAEst8Kg9uhg6rOVH0LAVRViHWrYczzv/?=
 =?iso-8859-1?Q?G8WVKSLjXcHrQqTXKs5GD1N/dId04IaZCIyJsrZIZbHKb655T4Xyc3tuBE?=
 =?iso-8859-1?Q?TKhjRWGjjP2UcuuNPIM0JXsZq+9fxXP1StI15Gn3MgN+Sqx0A2cUyZf/UV?=
 =?iso-8859-1?Q?SX+SfLZ7sEydhLHoty4N6UZTZC0Z0zEr++8gOkFAcLUAO1TsWm4x15/9ki?=
 =?iso-8859-1?Q?d9pmBHZ2A5sbrCb4CzMtq0SjculUnUnYiDcQTWpy+nq1O/E/t0U8ZKAlOy?=
 =?iso-8859-1?Q?19yz0oUccDGIjR/hGTZ/6ELkAo8ts7r5X5UVTTyfg7raXPU1aKq5Z35ZfN?=
 =?iso-8859-1?Q?rPLPcQZN227Gyue18/cX5IA7+ly8EoDZESaXbRwy2tCGNFuJePGn40wBsd?=
 =?iso-8859-1?Q?cAMcZ1BRU678Ki0VEKTb4r18OL/FdCUYFe0O1nD/om96JrUUUl1ylkpXdO?=
 =?iso-8859-1?Q?jUXV8gvy57NAeOe4dIt8J+zxmQFoabDrnZJdvWULt4g74V6adrw7W1homp?=
 =?iso-8859-1?Q?8P++x8eREy+9I8NXT7m39TMtBv3EPwpFTqneNRO4RQZY5aZYIF5Cyj3FpY?=
 =?iso-8859-1?Q?2Xy/SQolYmV3OTrXm2tOHSLYlKQjHovuUB2HsqXQC3FZgYnWEmrSXQZmfZ?=
 =?iso-8859-1?Q?D9GIBPchO9caj+x005I5jHknAiZ5YGtgDERVM2id22eg9l5NNyQEp8GivR?=
 =?iso-8859-1?Q?CiqW2aWZVmzho3i69Ea+G8mDSRurfs74QfZkIsctOYV+rD7uhaAEE3ahBc?=
 =?iso-8859-1?Q?5furKscoQSliOU07b2+Tmfa3EFuDJRJc3jr+XDZVRA5l3E5nu2yXkfauxX?=
 =?iso-8859-1?Q?WAIjIpvNnpJUxxny5A31kNAFNJ4JM/r3yR2uRm7rsJ6OjLLjaR8S2RhTUO?=
 =?iso-8859-1?Q?FRIxICbCcCho1TtsRsC7+4FpvKMy0hyzozmTsTFQHepvx1qc4xShtJB09S?=
 =?iso-8859-1?Q?oZ94X0qXPnU7LVF6LgGER+wBGzbPLegFpHQbuoyrpRQ4tBU/bjwvZVQo7r?=
 =?iso-8859-1?Q?7om79gjHPmaJbwfWH9hUwSixGsX5owBjxs2NzFqw64NcvoQ6QtOGeg12Il?=
 =?iso-8859-1?Q?XJiAIexecvWq9wf0NRCLDcbN1V6r/5gvmH7uMd3QG1xD195akB3swlzFUF?=
 =?iso-8859-1?Q?s2yU1VJojMUFHfmtGQl92Co0emU9XyPorHdcIgFoCky8Eb8E6JDDBXLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DCXSB9zm/GDkiqXYXZIBogzzbmXlt7/9xgzSFLeM+RlS7jZ7pm66JGv2QJ1mvm05ixkqwhvHyHOwE1sfbr42E7Nr4466SOACrkQpOyTYIMsmQqie0eJDo+Yq3GeVusfqHultbsdP4UgVqT1iUJjYk/ytd41B9cwICy0hVgGPgK7DEsbNt69SHuBJuDjqylWyo8SrEe1oycWbsg+iz2zq1OCbUEEH9VKikyzLmYLxMY+3YGJY4eTgZDTsd6zem8XT/0+YvHkZkpDxFXFkI8OcEVovKGsf3J1+jx3V0BWjo9jRz2fgz1dHq+6ei87/7nP6admA/tyLo7M2ibdK4IuBBoEO7bS+0PnOIPaTeU11uiZeWQrL7QhgtjcxsqiL7gN7rqpFdxx0I0CZPyrbwJ0lSWSlOD1NruR40rrSlhW62ucfb7rMK7gkJbuKKVgNyO1VlxY1H+FnfL4eoSDOo/W+fg/R+tvm9xV+pN4q+B8/7bCDo/A31TB2mcV3e8bsmDqiphcRGsbQJzcw6k0ajkucJz8gDBDcSd5ZDtcPBoJE5b3SR7V5yQCfsJb/MXViKlmw8E3INW+4pm7L9TOBM18MGKMkJ6wRkkBH09fdr7iczXo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4f29a6-13ff-49a8-92b2-08ddd127e855
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 18:19:08.9711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPzkW+r3Yk0VVWcNjMCnuP9U418X43cnx6GxGnFIYN5lDxNwNolFAeNJXZu3iJez6rDwEtuZx6thTVRJNeHY0O8jB3n0UhUd+Mqoe0FstoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508010144
X-Proofpoint-ORIG-GUID: AL3JTr6PhMzoYXYzKlbQAKgC2W3oGG8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MyBTYWx0ZWRfX4n4YplSz3B4R
 F0T2Fx7bKAKGHxziBsXqmcCVe4VHJk/EhklsgJf3iwO56gUT/UuHwwtm2GQw17khRiWZyQEvtSj
 6km32dSHKbssWd/ndvDET6ml87nkLNjz/kVeS85tUCIbL/Ca79od86EwEVJHYtFzZdGvZ71UhBN
 JlnAWbEl//Z41Wd5zp0YeMaUdtUNUWvA88AJsSlzrf3nKNoipStQCQc4O+iVQKqJAyuvP6vN7tz
 lwdLuDZlSsX46o6CvSXn09hG3UIOHkZfuDIwzK3LqS3uS3BdA3ZDRZqR23DRuNy4JVl+qc7ejNv
 LSX9qQqfHihHsKMS4kSq0jVtRXKKZi3RQh1zSUArUWO8pxGTzJXrc/bYkG1gSTHwfNF6mz8vXUy
 2xEPEGmOWXHMsxWMPnDBunAMA9OYiwUWoYCvzCP2MNkSsVZig77zZMc6WUCmgLCLkYKeNGan
X-Authority-Analysis: v=2.4 cv=FvIF/3rq c=1 sm=1 tr=0 ts=688d0539 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=R4kGA4PXASIxeMKQElcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:12066
X-Proofpoint-GUID: AL3JTr6PhMzoYXYzKlbQAKgC2W3oGG8_

On Fri, Aug 01, 2025 at 02:02:27PM -0400, Eugene Loh wrote:
> On 8/1/25 13:49, Kris Van Hees wrote:
> 
> > On Fri, Aug 01, 2025 at 11:36:17AM -0400, Kris Van Hees wrote:
> > > On Fri, Jul 11, 2025 at 12:40:24AM -0400, eugene.loh@oracle.com wrote:
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > If a clause includes a destructive action but -w is not used, dtrace
> > > > should not start up, even if the clause is ignored (due to -Z).
> > > > Solaris treated this as a runtime error.  We should do the same.
> > > > 
> > > > The test err.Z_no-w.sh was misguided and is replaced by a more
> > > > direct test.
> > > > 
> > > >   delete mode 100644 test/unittest/usdt/err.Z_no-w.r
> > > >   delete mode 100755 test/unittest/usdt/err.Z_no-w.sh
> > Why did you delete this test?  Isn't it still a valid test anyway, and since
> > it tests this in a more practical sense, it seems to have value.
> 
> The test was failing consistently on every platform;  it was based on
> assumptions that were eventually discarded.  So, no, not a valid test.  It
> assumed behavior different from what this commit message asserts.

Ah, overlooked that it was testing for the non-compatible behaviour.  OK.
