Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C026A1B8
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753789774; cv=fail; b=JwJOcqMrfJX1mEumu9wKW4ZG68Q3+YxCV9QUOLHgC44+hdrKTnUuVHEc5uNSIIb5/rLK/LoHIYsDqlokLh7OYrcsYfVVBnB+CY/I/y0eZB2F3Rzvfzf/2tptiUwJu/mVQTsEXOUOzuH0wc1SJJBJOuOCId1bWlGQsns3Rf0+0DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753789774; c=relaxed/simple;
	bh=8tagdP2W48FYUNtH2pOArWijPk17bAYJSl9U5X0NRi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hoZ+X+lApGBXsnCPQR/ym0pDm6stt8+/nT/ALtlquk+K2yJT628d7C/nXHXOKhF4e0EiCUy1ImQLVT+xynH7RvBZKv+xsbVJ1GcG4PeGXzhDEtMxvqLykIqkm2PgStW0eR5DHIdvpV4xZmCYZG8GfwlejE4u4YuE87z4PPrkZ5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B7gwJz3g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I2NJLR1E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B7gwJz3g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I2NJLR1E"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T7g3lA029620
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 11:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WdPvSfK8EhqFeQ+3Bj
	2AwCARSDLarJxuCdk4Xsj8Kv4=; b=B7gwJz3gXPlGYEVUIq9HmR0k9bADulVwM8
	l8R10TESdf3Dm/rawngxGqDLe2JOw61nlSfkFd9aLZzHK3/onI3B47cBJffzG/1Z
	zPVGiJhd8y3zxIPM9CVNdY7jYmyerierb4QuvphFlc05o48xt/begs7b4tueBemM
	a3tjdp2k0F6lH+iYUGrZACrLLVmud89dyn/5McL3WUoGptgpIC6zzVgFfl3CkUT7
	pX9ujSOs2SlA68AE+Kh7LIur+3eMRI3XqjzBFHBxJ9iarD/pxHNtzaYvh9SCjlTl
	6MonGzkjSTdydWIJtinAcxh2Jo/9laJjgzJADt3Tw5Dx5AZ0OmIg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q29qjg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 11:49:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56TAV2Hd034448
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 11:49:31 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013020.outbound.protection.outlook.com [40.93.196.20])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfa1pa0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 11:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqNVo3JHWPu2ncIjTWF2wphoYzPtmMccSCzKd1Szx/iVi+Km3b0OW2tDeKcLGnbbU+/YF5gzLT98YynoGaRDVPfLKPeafPlbaPYJrjsQRw8mk3wWcKD3KjsfZMIzHcnuloAWv3GjHFYJV4A5oeJ5YH7a8XDMNNpmK5vrXR5eK3nQkqH6Nkir4hVpcRHkNPyAgs1ORccfzRnbDWb1+X31VS5AO07MNJE7zTBHhD+2ss7w+4Jqem001OOzhvbQJSxFITV5yEXIRSXycUHWtZocNc2i83Ff0AwQyRpJbYzA5Yc2zVhhZ+RQ7z2zGnz3sRh/go8L06ecbjb+cU9g31//dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdPvSfK8EhqFeQ+3Bj2AwCARSDLarJxuCdk4Xsj8Kv4=;
 b=mBpgCHX/NqErWC3f6OJK7ue2y8FfcqZVh0SXsOXbBOY+yeT6MjfqMUd01SKQwQA0ZdknYo0RAkFlmqDXx0my75/5Ho8B7ORGU6NJFx0unaUb6e3fqyoWR6OANg20eXbRbRM+0jAJj+ShES7cf//bJYUC/KdbvgNUVbDFNYwwHnXFsdEYE5fgQrCuSl24NZ3XfxzMu5T1eJGBynES9Wl1YmqCWDsCFWRla8kxC+l/6YeMS0Ypf3fPdUFvvDOvms9yNVcGhdSYoGRtNoJa7VPLqRL3G3bDMpgBBE19MXJ4UZsvtPynI894426dBUjKEwqzR5WBSPh3nRu6e0MEyvusqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdPvSfK8EhqFeQ+3Bj2AwCARSDLarJxuCdk4Xsj8Kv4=;
 b=I2NJLR1EyzqJFsuhTuoiV0Zl+cc6Sh2rkYJBSbGFFZnWN6oxXLmYxDHzr3LkT3I40D7NzaW7c4xkknwtHHA9KwZ0z4vd0jSiZBGNlkceH6rUh+Ry8TvVEGsvwcoJhhUgvxo805nnIgK0Hrf2wQ50Cw8LKpZq4F80ET8uRBGxFfM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7049.namprd10.prod.outlook.com (2603:10b6:8:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Tue, 29 Jul
 2025 11:49:28 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 11:49:28 +0000
Date: Tue, 29 Jul 2025 07:49:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v6 7/7] selftests/usdt: add is-enabled stapsdt tests
 using semaphores
Message-ID: <aIi1RfHbOcXFZpuW@oracle.com>
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
 <20250728163611.1570773-8-alan.maguire@oracle.com>
 <aIgsyUvMfwfauSZO@oracle.com>
 <8346533e-4625-4998-b145-04d3cc9079bc@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8346533e-4625-4998-b145-04d3cc9079bc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cba8414-b306-4c49-0eec-08ddce95f918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MUJbC8RdvOtzige3AQKdW+50XLL5kJzYpv2yRkjf39aVOd8mweb524FX6n08?=
 =?us-ascii?Q?/uUp2FpzXoNPgpWaPhgOrjxMPI1MjDlvCOkkLVxqO3wQBGU6bbgymtV24XhQ?=
 =?us-ascii?Q?ry3k+PkPX45vkHYgI1dGcNxSQawb+CigH0AqevKpKS5JADFw7NH144SGPCbJ?=
 =?us-ascii?Q?9kNSmLVp5vdURQyVHKOrDwedKpLmNhdqYFIZkoVMc9ckgHZ5jH1RmKuLt4yz?=
 =?us-ascii?Q?Bo4bhgfjDLKGWISjpMPCZeBmdC5sGybEYr//A9pzWp77IHFOiO2nLh34x439?=
 =?us-ascii?Q?eNp3xopArnOhvWMAIrL25DdkJyETQGXDprQIzyVVSBJ8idLbTwmUoOVr3WT5?=
 =?us-ascii?Q?q+iQN17QCjA/Ohn/v1ITdlZLYikQh/6z25gcRir9f7fzs681qkkaCPstNLey?=
 =?us-ascii?Q?ZxIhQ+HLupFP8WFXvOGOIn5w1nIV1NecrIdSp4AjnP6WwSNFzVTqcWmZJnmM?=
 =?us-ascii?Q?C4agxb7hgyh3M6p7oCl178PoP9zLMrVbvAtM2w8oKEayMJtF+WsWkB2I5X4l?=
 =?us-ascii?Q?0xdAdF78NZ0rNlP7zjm87RqPxTQZl9O2tsB4D1p1EwmamuwcMxjO1AAndlyn?=
 =?us-ascii?Q?vai5pCerXHeNYHC2ntJO6Zn0UBdnkUr1/7lgpJ4tXjkpCLxOdhLtEmOSogaz?=
 =?us-ascii?Q?oOcA8rSDkq6262/hbY5e0sIIfDkzD/7f0zEwEemhXmdtBcHAIvcimpepIdfU?=
 =?us-ascii?Q?SEPQSF9+XrWlITwbQsaH8sd70HJJ44ikT/jLl04T3RX810biGAlcM0rK/sEO?=
 =?us-ascii?Q?x8r4RXYKEDgKbB+7y8iFNdNuSgdTHGBxX+DE3K4dcIm7UMszBrAjCRxLw3BY?=
 =?us-ascii?Q?NyT4xFB1nePERes9nJl0dib8/HZw+TKXQLF0dp14VnSIcLE4mLFQrboDF/FN?=
 =?us-ascii?Q?JbSWdn3h8BWStGF1t348JbeX0N5g8NNgRrgW+zvAF0jbEdNq86TQet2yGNDF?=
 =?us-ascii?Q?8bj8STtGq5fsHjR+SZZENW+Bg9Tfbswh8GSYBA+/Y+FMi4RsyQp2aI+0bFjX?=
 =?us-ascii?Q?eXPl31fst2IjsgvxDsV9WlMeSPgarERAHGnjJN+9magPijARA1win39s3TUy?=
 =?us-ascii?Q?2lQBgAZjF8rSNFqQZAX8LW4gonySCM5fsHJdj/uSaknO3BSeG7/V0nEdpFBF?=
 =?us-ascii?Q?RL8eNpEPz8sOJHlc0Xe+m/GyFXrCrzdAjEYr54JEf7ByszvVZeJ7YRvsQezp?=
 =?us-ascii?Q?P6nege4JDS0JsteRN5V8nGFpe4NxEN3Mpax8MkMAZAuLcdxPtvFlv4PDYWoS?=
 =?us-ascii?Q?TFzMrq4UrZvHFMv6gQ77mSZ7odlmNepuB89pz8cmaWuxnheTRdkPVF3y4dcU?=
 =?us-ascii?Q?vPHqKzZiM6mgECCPcSSrXw0xOIWPwWcSSAdOUg+HR/WiFtDrkxMEDw+r5U2I?=
 =?us-ascii?Q?98NbkIoIkrhqvDsNrUNbX5vaoGADipnYa/kiUjDZ3Giee1mEaiykBmIl7oke?=
 =?us-ascii?Q?FhDsXUZAr5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ICqqCj0NfPIe3VK0jaGJxmDY5TUAqfJY4OQfPn01plmwvuF1WtiurxBOAVkE?=
 =?us-ascii?Q?R4jw7rIqZazy5thCGIW6WeqDctNIUFSw2rKF1xKC9nHSkeiKSEY7siTACv+o?=
 =?us-ascii?Q?9angGtCOKlF9FuxSl44DZEiAY2tnTv2wNLIl/kRd9L7bDkeSkmLuVVyF5/nf?=
 =?us-ascii?Q?AT0bUUYngz6iOw3jZdGTxlYSApN1DHTOr2bJl+mEB4Dk8j5BuYz2OTwMDrPx?=
 =?us-ascii?Q?evJAK+01ddkCnLL19nKp373VpbRc3Um9vCZ2oclV88rzoxdC7rg00g1B0V0q?=
 =?us-ascii?Q?OsAqolehW16wWc2JPyDmlYDSvWYupyP/feBbWfVp0KEp1L1Yt90dUab3vLak?=
 =?us-ascii?Q?lvtBZ4+EOJLaiU7tmaEWrC3J48B6CBvds+FcdjAcDEBS7vm3NZ/IAMSXEgcs?=
 =?us-ascii?Q?FJ+pNEHYKzemmStQzqF9gjnQqkOxk2POIdfzamZ6IunqOiGT2GzPRzq0mZde?=
 =?us-ascii?Q?lX2OcZQ++elg0GrdE7QdXXWLdVA4jqhRsmZDRmz8y31XIO3ZKmsx/2Naijcf?=
 =?us-ascii?Q?IqoYhO25QTZJo4u3zOfhZ/n4XR9BXo+isQHhZ9pdX9HNye8vS456CaBTYAV2?=
 =?us-ascii?Q?2R76hsoeQA4ugSuvVJkfYZzPAvTspmjsDQZrs/AaQ8lndeZAHkZQ/SI0M+DD?=
 =?us-ascii?Q?lpLHhsfXu1OuZ8UnN7L9sZB6i0dkeGJ+S9r5+axJKN70AGh3gUCWpXPtkNVy?=
 =?us-ascii?Q?rPtNmvXaf1n3DDdRph5J43uDCn5GmEh1k09xyLgrP4wwCtDdiNr7QaVWxKrb?=
 =?us-ascii?Q?s0wrXMtSFzJCo0fY6kC6tXu98cYTasvrtMhvytq0vuPQyGSSskXbv+cpD2Nj?=
 =?us-ascii?Q?jM57aPNg+1W+MjGjqGHsxddWYV341cFZoawfob+ejyzbOeApd3QzKtHleA6/?=
 =?us-ascii?Q?UQPfJPP5ENEfQWYvVCAnVxea4OsfcvgQYm43aOp4N5jnToc6GqwnoQqk84IZ?=
 =?us-ascii?Q?zpwn2EFlsG3tPMkpV2A5nTDgW8jA9WzL8SYjQPIuXLD0Jeo6mE12Yht0dX1p?=
 =?us-ascii?Q?88BQAf4LyLnxWIAaeuF+r+qI2+VfL8n5rEO9ydgAgP+Ufb4/bjRdKQBx3SvQ?=
 =?us-ascii?Q?U50XlXTsx5Oq+FNFcIVYEpBSwdNznswgNvlfN8qU0mVNb8qKMhd1yYjPMmEQ?=
 =?us-ascii?Q?DQ1QUqQC4XCIOr9mVTqfogaZ6YqiLrO+KxMLI0t4z8b3oYIoS5UFs3fbm9Ap?=
 =?us-ascii?Q?Kx54vcUHZ4wRAvaU1WJxQoLBbe3hsnck7L/XJwqXCsUzZksoHtFABUWb+B5U?=
 =?us-ascii?Q?YUiGyJ0s281+wOs9UY8qjr+lNonGoa32DrAumFLidq/U+4DppX7pBxJ9QPtQ?=
 =?us-ascii?Q?FTcMXg7q8/Rhk+VmmP+hs0QmyLiiZlhLctCzNoUCMXMsmsV8d6GMkpyNpO+k?=
 =?us-ascii?Q?ls0T8Mv4I59NHKTXs34fxm0HADxOfOktvbOawuzsRcnoFOISndxDpoTb+89+?=
 =?us-ascii?Q?x5hqdZOUl60UywhH747fdR1Ykx7Znmcf2GIilTLdkE1/LOA0nLMnuyld40H8?=
 =?us-ascii?Q?2s+syMQR+zGtTHfpcLmEayL2gsIgFFeYHqZSNcxkjJbyIoOsBxU3JJcL3YyA?=
 =?us-ascii?Q?z6HdXhq6TV1QBdRn0VqVbznv/MpF0hA1Ze1MMTqv7sAmBxOquC5JX9sEgVAk?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cpkr9CgYopq0vglJ+7LFSrv5RoDmJUyh78dTbdgPvjTQPZgjqxqSJH4hvgSkhWEHhwkP4jV+QMeo8umhgLvXOUhc3dzDuFkq8lUp66KpdrV67/2+eOWD2arAz0ukQRaRBtrvmpjvpkXioZgRfHf0A6TGZ9LatuiTnOqqVw3eLT+jeK+rwuKXGY+LsD92EybgovIxmbN2QSC91YlQ9JWZ17r9vfRxA4AO5y+0MW922+9KyG1H4+7CzwG2GW5maaBWP4KkUHExDXdZe2fXqSgvOsHydy13JrxOtGltCJVUFfS4nGRUX6JqQWRHD3VgU7wC1ciInAotBNhtMAaPnxQW64K+MyGDm1a+EYELU8HUdMfJaipKIU+D9PuRJN7eeRqyB76iFPrtVsawLRtEkWRH+h4GEi0tE4JmPlymAdr8tpMa64IPzFzLwC3ZixCPoPYi3dxBENPXewrvnQlCyKghEQKd/V7tFNgdEwMG42P2PAYpAsi9fEzVs7Ag6jhc2KOVWkHaro6mfZlvuR21O0aGvwkKid/6Ng8V1zqVI2ln8cm+kfPA4CsiHGY18fd4iypnDEs6UsP/10avVt23wO/9DLdH5Y3ie5+ZuA+Q47mqZAM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cba8414-b306-4c49-0eec-08ddce95f918
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 11:49:28.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mROTlr+MRAqpRYrS6SVDSl2tfQsN3vdXgxETAJ9d1U5H3tUO1utRffa80nFlbDVXLZ7ucmnTCyJjVBThcEhHlXxevu+g0vJ2yBiCMmW2ZZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507290092
X-Proofpoint-ORIG-GUID: 2EttRnmL_62_NfEfjNAq6R_z9O11h8dn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA5MiBTYWx0ZWRfXzGgpHjn8DXbh
 gGdF9X0ovgYnvpgC9zHNrRPBgv8w3MeFc35BG1ENKn6jxlG03Kl/RJseC4+ZPNXMhiG+uH3Eljm
 EjPKDda5EB4NmcxBGsWRmd6+xhNvdgqfqWnu/uwN9NgAu6wIHFW3uN9Ly7+lW9BunGQj25LYgK/
 ibUOD0bS0sBqNi0fpWmj6UMj5zLNTx+EzERLtyKS5CAa34df+TZsiJImp/ZVI6dYF3UWiYECTzy
 EvUuuFAekMz9rpaDkBTqkkZq6VI/Yl1YP5QNo1tBxgd03RcjNYUWYI9vFcCroeGvDC+3C3mrC4Y
 DFAxmu9cS1MGBpOLa9kO4nkwF6455ipEx5E5XbPFQTFW9klm+kuuPrfEm0VqffIrjCZ7bvF668k
 Yjj1qgrH9gCK2j71htGEQGFUEHMFS4GXynG0t5xX4L/WThOP5kE2b5v0k3HOS1rc7pAAIQVU
X-Authority-Analysis: v=2.4 cv=FvIF/3rq c=1 sm=1 tr=0 ts=6888b54b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5S69YSJl993m5C-lR_QA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 2EttRnmL_62_NfEfjNAq6R_z9O11h8dn

On Tue, Jul 29, 2025 at 08:37:16AM +0100, Alan Maguire wrote:
> On 29/07/2025 03:07, Kris Van Hees wrote:
> > This test is flawed because you never initialize the semaphores.  If you change
> > the code to assign 0 to then, then the test fails because the probes never
> > fire.  That makes sense because your implementation does not actually do
> 
> Hmm, I don't see this behaviour. If I change the semaphores to be set to
> 0, i.e.
> 
> -unsigned short test_prov_zero_semaphore SEC(".probes");
> -unsigned short test_prov_one_semaphore SEC(".probes");
> -unsigned short test_prov_two_semaphore SEC(".probes");
> -unsigned short test_prov_three_semaphore SEC(".probes");
> -unsigned short test_prov_four_semaphore SEC(".probes");
> -unsigned short test_prov_five_semaphore SEC(".probes");
> -unsigned short test_prov_six_semaphore SEC(".probes");
> -unsigned short test_prov_seven_semaphore SEC(".probes");
> -unsigned short test_prov_eight_semaphore SEC(".probes");
> -unsigned short test_prov_nine_semaphore SEC(".probes");
> -unsigned short test_prov_ten_semaphore SEC(".probes");
> -unsigned short test_prov_eleven_semaphore SEC(".probes");
> -unsigned short test_prov_twelve_semaphore SEC(".probes");
> +unsigned short test_prov_zero_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_one_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_two_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_three_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_four_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_five_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_six_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_seven_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_eight_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_nine_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_ten_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_eleven_semaphore SEC(".probes") = 0;
> +unsigned short test_prov_twelve_semaphore SEC(".probes") = 0;
> 
> ...the test still passes. Are you perhaps initializing the semaphores in
> main()? This has the potential to overwrite the kernel-updated values
> which are incremented when the probes are enabled.

I put the assignment before the SEC(...) which may have caused the semaphore
to perhaps not be created as expected.

Also, do you actually need the SEC(...) for this?  From the look of the code
in the kernel, any offset in the inode would work, and unnless I overlooked it
I also do not see anything in the macros for systemtap that require a specific
section for the semaphore variables.

> > anything with the semaphore, i.e. if the probe it relatees to is enabled, 
> > nothing happens to the semaphore, so while you do store the address of the
> > semaphore in patch 2, it is never used for anything, so this test passing is
> 
> The refcntr address is set in parentheses where the probe is set up -
> see uprobe_create():
> 
> 	if (refcntr_off) {
>                 if (asprintf(&spec, "%s:0x%lx(0x%lx)", mapping_fn, addr,
> refcntr_off) < 0)
>                         return NULL;
>         } else {
>                 if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
>                         return NULL;
>         }
> 
> The parenthesized value is then handed off to the kernel to
> reference-count probe enablings.

Ah, overlooked that :)  My bad.  Sorry about the false alarm on that.

However, there definitely should be tests that also check that when the probe
is *not* enabled, the code is indeed also not executed.

> 
> > actually accidental because the semaphore initial value is (apparently) most
> > commonly *not* 0.
> > 
> > On Mon, Jul 28, 2025 at 05:36:11PM +0100, Alan Maguire wrote:
> >> Is-eanbled probes are implemented using semaphores where the
> >> semaphore address is specified in the ELF notes and passed
> >> in at probe creation time to have the kernel reference-count
> >> probes; this allows us to have argument assembly code that
> >> only gets executed when the stapsdt probe is in use.
> >>
> >> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >> ---
> >>  .../usdt/tst.stapsdt-notes-isenabled.r        |  14 ++
> >>  .../usdt/tst.stapsdt-notes-isenabled.sh       | 151 ++++++++++++++++++
> >>  2 files changed, 165 insertions(+)
> >>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> >>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> >>
> >> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> >> new file mode 100644
> >> index 00000000..db6d18cb
> >> --- /dev/null
> >> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> >> @@ -0,0 +1,14 @@
> >> +test:main:zero
> >> +test:main:one:1
> >> +test:main:two:2:3
> >> +test:main:three:4:5:7
> >> +test:main:four:7:8:9:10
> >> +test:main:five:11:12:13:14:15
> >> +test:main:six:16:17:18:19:20:21
> >> +test:main:seven:22:23:24:25:26:27:28
> >> +test:main:eight:29:30:31:32:33:34:35:36
> >> +test:main:nine:37:38:39:40:41:42:43:44:45
> >> +test:main:ten:46:47:48:49:50:51:52:53:54:55
> >> +test:main:eleven:56:57:58:59:60:61:62:63:64:65
> >> +test:main:twelve:67:68:69:70:71:72:73:74:75:76
> >> +
> >> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> >> new file mode 100755
> >> index 00000000..99fcc844
> >> --- /dev/null
> >> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> >> @@ -0,0 +1,151 @@
> >> +#!/bin/bash
> >> +#
> >> +# Oracle Linux DTrace.
> >> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> >> +# Licensed under the Universal Permissive License v 1.0 as shown at
> >> +# http://oss.oracle.com/licenses/upl.
> >> +
> >> +# This test covers all stapsdt probes fired by the STAP_PROBEn macros.
> >> +# Arguments values are checked only for first 10 arguments because
> >> +# there is support for arg0 ... arg9 only at this moment.
> >> +
> >> +if [ $# != 1 ]; then
> >> +	echo expected one argument: '<'dtrace-path'>'
> >> +	exit 2
> >> +fi
> >> +
> >> +dtrace=$1
> >> +CC=/usr/bin/gcc
> >> +CFLAGS="-I${PWD}/test/unittest/usdt"
> >> +
> >> +DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
> >> +mkdir -p $DIRNAME
> >> +cd $DIRNAME
> >> +
> >> +cat > test.c <<EOF
> >> +#define _SDT_HAS_SEMAPHORES 1
> >> +#include <sdt_notes.h>
> >> +
> >> +#define SEC(name) __attribute__((section(name), used))
> >> +
> >> +unsigned short test_prov_zero_semaphore SEC(".probes");
> >> +unsigned short test_prov_one_semaphore SEC(".probes");
> >> +unsigned short test_prov_two_semaphore SEC(".probes");
> >> +unsigned short test_prov_three_semaphore SEC(".probes");
> >> +unsigned short test_prov_four_semaphore SEC(".probes");
> >> +unsigned short test_prov_five_semaphore SEC(".probes");
> >> +unsigned short test_prov_six_semaphore SEC(".probes");
> >> +unsigned short test_prov_seven_semaphore SEC(".probes");
> >> +unsigned short test_prov_eight_semaphore SEC(".probes");
> >> +unsigned short test_prov_nine_semaphore SEC(".probes");
> >> +unsigned short test_prov_ten_semaphore SEC(".probes");
> >> +unsigned short test_prov_eleven_semaphore SEC(".probes");
> >> +unsigned short test_prov_twelve_semaphore SEC(".probes");
> >> +
> >> +int
> >> +main(int argc, char **argv)
> >> +{
> >> +	if (test_prov_zero_semaphore)
> >> +		STAP_PROBE(test_prov, zero);
> >> +	if (test_prov_one_semaphore)
> >> +		STAP_PROBE1(test_prov, one, argc);
> >> +	if (test_prov_two_semaphore)
> >> +		STAP_PROBE2(test_prov, two, 2, 3);
> >> +	if (test_prov_three_semaphore)
> >> +		STAP_PROBE3(test_prov, three, 4, 5, 7);
> >> +	if (test_prov_four_semaphore)
> >> +		STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
> >> +	if (test_prov_five_semaphore)
> >> +		STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
> >> +	if (test_prov_six_semaphore)
> >> +		STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
> >> +	if (test_prov_seven_semaphore)
> >> +		STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
> >> +	if (test_prov_eight_semaphore)
> >> +		STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
> >> +	if (test_prov_nine_semaphore)
> >> +		STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
> >> +	if (test_prov_ten_semaphore)
> >> +		STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
> >> +	if (test_prov_eleven_semaphore)
> >> +		STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
> >> +	if (test_prov_twelve_semaphore)
> >> +		STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
> >> +}
> >> +EOF
> >> +
> >> +${CC} ${CFLAGS} -o test test.c
> >> +if [ $? -ne 0 ]; then
> >> +	echo "failed to compile test.c" >& 2
> >> +	exit 1
> >> +fi
> >> +
> >> +$dtrace -c ./test -qs /dev/stdin <<EOF
> >> +test_prov\$target:::zero
> >> +{
> >> +	printf("%s:%s:%s\n", probemod, probefunc, probename);
> >> +}
> >> +
> >> +test_prov\$target:::one
> >> +{
> >> +	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
> >> +}
> >> +
> >> +test_prov\$target:::two
> >> +{
> >> +	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
> >> +}
> >> +
> >> +test_prov\$target:::three
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> >> +	       arg2);
> >> +}
> >> +
> >> +test_prov\$target:::four
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> >> +	       arg2, arg3);
> >> +}
> >> +
> >> +test_prov\$target:::five
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> >> +	       arg0, arg1, arg2, arg3, arg4);
> >> +}
> >> +
> >> +test_prov\$target:::six
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> >> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> >> +}
> >> +
> >> +test_prov\$target:::seven
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> >> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
> >> +}
> >> +
> >> +test_prov\$target:::eight
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> >> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
> >> +}
> >> +
> >> +test_prov\$target:::nine
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> >> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
> >> +}
> >> +
> >> +test_prov\$target:::ten,
> >> +test_prov\$target:::eleven,
> >> +test_prov\$target:::twelve
> >> +{
> >> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> >> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
> >> +}
> >> +EOF
> >> +status=$?
> >> +
> >> +exit $status
> >> -- 
> >> 2.39.3
> >>
