Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09371AE024
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621121; cv=fail; b=tZQSOT3wiPPVy2nd7RE7duUVUp7DSvJiuZ91HJmk0sYYiUkYRn+BW67xrJu1jOdeKBoncmvEu+AaRlwaU2pvTr1YK9UL6JleIbU9goBZZuMdttsc0FyUbFYgn1SbTztqEzq0I8hfuOU98VAc8hVLS9Ww8vg1QkgoFwwJTZZ+5zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621121; c=relaxed/simple;
	bh=fY/BbM7SpWdVOkCmIXuhk23Al7gBjR0zY434mrENDIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uiS506IBHWYWuMiYkxp4r5SxZR3XMLb7+NOY0HfDujuHfvwXx3hHeUBWXcbxzzY0Vc09Zr/eSdcZw3zOej4AZuxFJOKVf7IYy5ygb5n8EQweMiKk7mLiYpIPLKw8bHYp5UWTloL2zWJBuCZxyDmadJhIwaCfUWIdrotTSXHnqK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JpGDUYKM; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SdSeiavx reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JpGDUYKM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SdSeiavx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtXD7022309
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=Lrnw0Ks6vdYoo2sl3ETc7sY70WHvMn4IT4GGOx8TYSo=; b=
	JpGDUYKMcyBsJ+MAMkPOq7yHrAzhve0RK9go6yZ3pVt9ExqozeS56D8joFYYyA6T
	n+wDAZXXg/78Puu9d6j2WdA3NdNEfQUovd8+caFXK6KVB74qd4ibPt01Azh4gilg
	Z5xi1CAni/7lxbj0vNxj0r9zP3bWVBzOr+0NeYeVp4ph1a4kN075PuajaYr1WVEC
	fbKa0PNFsarwcAgQwmgXOZbz0tuDUQCwvxMKt8wYL6ufb9dt0DJ3Qj3hUtCxcl9j
	qrf9L2FH/d7/9LDF+8Gq3t8TE4iHzvwTuZXp9A43YTegux4LvjvQsC/BueOvEYOL
	8mxfY72H50PlxEneAdw8eA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdwhu1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:51:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472HVZjB002579
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:51:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c4h1a6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meXm8XX896aQfPtbYI2BVo2bRFhQvtbkU3Puk5etk2zjlO4xbiU3eMRag06rYy76lMHnSM1xq5B8+tLvSFU+yYJRJhUUVFEQ8GzvzkX5qNn7A6mpYr5dtcmC74gGB+TT1wGjOoZ2G2qA47TcgW5N5RL9rlMG8gjE0zpJSGYbfAwA0TictS3GpGZYQ5Sho3Hz4tqK+dDAseXBoaBq9HxFDO2JfWQRO8sZBuu2kSyIDYBGQaSqwSR4KhS8MSN+FuLXrb1HoWECrrRIx5q51xoNhZ7098IJPX+ZIRZmpZpnKtjpV4EvoF1IEZD3Ji5WChLa3WZUVmjqcGwZEI3lz+I+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4slJFFJucoyUJ1O5iPufdmQUWYxuU4/NWV08s4WGWw=;
 b=DNFp2fQ/Br9p770h0uVteJkq7j0iF6irobXdWzt5pY4DP59sEG4Y1oxLIkRD7oyY52nTWmKOCI5OPQ1zYumm8w8QTcb7Duj0VjsxRaTb0oSdYoAXqgaFIKdBmdh58yaPsvjr/FPKDRrCCj2j1lmlUL3TkwcA8dIhM6xtRFARZFju5vqEffB4VGFalQe0zahJAAOsuB0Z3rF1eQbTn6vYxGm1832/esviBwDQuLoSf/BB+b9i6lKwopSC2CkHvet87VcBQJnd9euaSOCPwKbptDY92pM75yNFPNiKG4rgDBpgqgw2pSfL+OwOQuBopnmwOF65Wzj9Bri508ONFybRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4slJFFJucoyUJ1O5iPufdmQUWYxuU4/NWV08s4WGWw=;
 b=SdSeiavxlDsXXpd3Wg6l9H8vcpMnOJHzuUA1OHOKLf7+gRHgDwb2rOhZUJL0RcvumEOX4K5fdUf4edQiYRlquvLBYqi52dMTX8xFKKDSmPqosJPsSrKO+2NrCUnaQdGrUEnYoob/LV9zTrVmSpBxThi1QNfkIr4oRzIa+kL8TZM=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by PH7PR10MB6460.namprd10.prod.outlook.com (2603:10b6:510:1ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 17:51:53 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 17:51:53 +0000
Date: Fri, 2 Aug 2024 13:51:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: fix another use of a kernel variable
Message-ID: <Zq0cs5qKo+huiPGm@oracle.com>
References: <PH8PR10MB62929228334CB595A1B855B6C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
 <bb6b2e21-83a6-461d-2c5b-0bf66f17774c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb6b2e21-83a6-461d-2c5b-0bf66f17774c@oracle.com>
X-ClientProxiedBy: LO4P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::16) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|PH7PR10MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc1733d-de81-4d35-99bb-08dcb31bcaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?JxEjtMzCE0tz38DCstwVJHcXaqgsPqKK7L4wGwcLHF0/yw14fWDqnXOmcj?=
 =?iso-8859-1?Q?bpjhsqBeDCN4Kwe8IbEQN2XNm1KxP+eNygPsnUL2M415A4oN2COmfmSstZ?=
 =?iso-8859-1?Q?27EBMh/5RRPkGzKWZWRo4cUW4JfH2CTDX/CFbnEZdl00Y45h+9ySfgEMoF?=
 =?iso-8859-1?Q?SjUFe9lmtzWKAHM4wRLvetBaWOyxCFgfx7jhYf2hshWwN3CW4UXxpPP4EN?=
 =?iso-8859-1?Q?tl9/fuKe1P/uUozjLDuw2pA+kcXnor5zyfmQfPcwotA4fEaP5tytc9woZw?=
 =?iso-8859-1?Q?orh1hsHVHtd8/b8ksxCSO+okcsixLGpDPvGPyw6RLscxaaBjeG037pl1Ji?=
 =?iso-8859-1?Q?XKGPOJMx0o5JjBV3Q2rW0YDLpGF+NbkzUfKmIQKOnVb2nlk6WbEztP3FEc?=
 =?iso-8859-1?Q?2Q9LrupFbwvRTIAzmgxwValBp6/5304SA3CowKMQvDwluqW/cOC6WClWcs?=
 =?iso-8859-1?Q?Sk7+EE/Oum85+IWpsUaBdaN+ONEyAFEu8tlYzwT83hSewmfEMJkeTKeVys?=
 =?iso-8859-1?Q?i9d+07YirSy1dQa0v+TLRC+5hYX1DDTwbwYxWy2fUIkylEj29Skrwr4Lmh?=
 =?iso-8859-1?Q?YlfMmutvBStlZhA9kkFBHc5ownXoB0KahgfeV+/runLj+gHGdRX44YPk1U?=
 =?iso-8859-1?Q?2EOL8macDbToSqN+kgaA8TX21JxcJg9jzAU3wXvNrClYJ4eKfWj8Wv8YM4?=
 =?iso-8859-1?Q?k0VIWrRrvyTcleO8nu+CM++ttBHLZVHYBLpBqhEnW045c4x0ZZjEifrx1x?=
 =?iso-8859-1?Q?+d7vg7iCFI1zrnQzR0cwf4Zl4u8fSZmyNF1RdHN0pJWEE/EjZVd+paaEfJ?=
 =?iso-8859-1?Q?Dne7aRz8EFe3DVQDQgi5131m7kcXxWsz1IRNCVsC3nANflOelEOsqzVFUv?=
 =?iso-8859-1?Q?f6Ea7hegsHtLfnXhaZSHhg3R9PA1sTtKIjGw/1X2f3GIT/1/7oZfNCVweE?=
 =?iso-8859-1?Q?phwYkppwdShbcnBSqW54olLxwKkFjM9h1qX0ba6EzW68EyHYORowIKpG80?=
 =?iso-8859-1?Q?IflYHLptDgWLjzeEtIlrsWDPCDaSBsvqju0UL1+lCpfjpxbgqsTWYnMPd2?=
 =?iso-8859-1?Q?l8bBbNtmqiIdm/fdDGmRwz8BRvw3+3kNPXQ4kMnWniiV/E130USX8oL7f/?=
 =?iso-8859-1?Q?2p+BSFb3t2AI6hZBSkPVpftJleIfrvCgQOxamWUJF0of4PX+CJ9qK7ZA3f?=
 =?iso-8859-1?Q?pFlvO2ABTBi+LsMF/onQKqEglfnumNZcjEU3IskdZ3f519z3Wc2rx56IR9?=
 =?iso-8859-1?Q?t0OI2p9TEINVktwzg+sjz3PSdiJiFEuTkRALFsPf3RuTuqATnix3Oyp+++?=
 =?iso-8859-1?Q?I7LH5FUyOacAzhikxZKyBaSNT6yqlkr9hYtPFKuctRfOscfD3iA9xQIRqw?=
 =?iso-8859-1?Q?OahxeiHxZjbk+m02HqKac3M/FmZBGReW8InrfJUe3HkCMmAOkL+3A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?56mGuRPCqyC4qf7hsDJis1+Gn3BxwJpYPuh11UhcBFFlyUtwZStXF5APC/?=
 =?iso-8859-1?Q?22b4Jk4btyQ2zuks/3Mkt1+0vSD59671cR/7dVje8j0oR29K9VH2Eskp8I?=
 =?iso-8859-1?Q?stwwe5OCZxNrvBm+6LYrMarb/giuagUkh0/0d5MfaLPjNnCV9siMzMDWat?=
 =?iso-8859-1?Q?b20XAUU6F/Ho9fSxYW5MBV1pO9bhEPLOzkodCsD4Kk0pE1rjt+TcCoGqC6?=
 =?iso-8859-1?Q?H88HMryXF47Y9Zr3pg7kbXBQ/IQDPqdqIorh06FLjAn8z3sM8KiL5BYPk2?=
 =?iso-8859-1?Q?7jv0MJlPryEp14TUGJOJKax61omCRF5DECnJFbGseLPzI9T5iMFvIcBFP+?=
 =?iso-8859-1?Q?mydNFdPXO2w9zO8EEylDr8idVV7nPgbWt+YFXLX6rj1MI969oI6paXs1yx?=
 =?iso-8859-1?Q?sUQJP6fzGFngE2L7FHuS7Re6gv+wnVIpYPoIBm9nEubdlbH5oXfwM59sNk?=
 =?iso-8859-1?Q?IvGnmUU/9Jn0CbjbwcAPUseqKS99ybYMqvqeb/+CoO37E+GMq3UU/3VuR3?=
 =?iso-8859-1?Q?+2czyLPVh7AwJFLXpUTpLhCdkNyQg1JrleLkZVwbpgyBepx6OZBDdFzm+o?=
 =?iso-8859-1?Q?wq+BPdiPh4B3WKrTJIq9F4N+CruNCxxwhl4ngoE/neVJzoNwkTRTsuRweA?=
 =?iso-8859-1?Q?kuIc/aoCkjN7M1AeBGjioK237IZgSZ8Zq7zG7O8nU/sYOLqNy6v4wx02Gc?=
 =?iso-8859-1?Q?IFgj2U6l/klmTazW8GWS0IYPGjVLQJwxaGI334FVpfqWCws4Fnpi9AMo6k?=
 =?iso-8859-1?Q?uH04ZNRko6LlAtaHbHbAzSNjba+diwvfP0RW6f/MtIutgj2ACFsLcJude0?=
 =?iso-8859-1?Q?T6gWLsa2YScAHVD2s6qO2CWARW4MeTmkJ3oaUmtjU7xhMjkGTPxmx/EvP8?=
 =?iso-8859-1?Q?EWrT9WH0/wvf1bQ2q06WB67LsyVVMs45Mgds8yWtqXmhtKTMrD4h9At6G+?=
 =?iso-8859-1?Q?fYSW49X5lw3WdI3LbRAgK4DArowrAW2NdHdtGsxjk8qzR6+raxm7oJvePX?=
 =?iso-8859-1?Q?V4H6Ql+ioYmJIx++pzNHxH4UZQFTmukIITymhLmyx49SWLTJCbSQfN/7my?=
 =?iso-8859-1?Q?BWoiGhWgVlq6C8MH/nER82A9mFdMg3/GQlCSmRYvf0beA0vd0Wc0DUMy6f?=
 =?iso-8859-1?Q?+3Ftd55U3TWVMzJM4EbmRn0pbQ7ozaPksalQvU77eNLIQW3qrW1Rf1X9Kz?=
 =?iso-8859-1?Q?O9tB4BG1JdMyCJnvJay0T3E6p+OXKpoaz/w2/fgkNZsiRVc2l+jsZ+tZD7?=
 =?iso-8859-1?Q?nbnN+oNV6749Lc82dj9sktCw7fEk0QrVuXLvA1FFhKYhePQutkaX20W7Gp?=
 =?iso-8859-1?Q?Tl4VfiMrAb2Jc957Fw1vWNmdO5OFGT5UsVcVbQMK558VUJFMT+ZzXm91Vf?=
 =?iso-8859-1?Q?sSb4WiGLq3vwLv+qjDVnhHDRuZoZdech/C0BAfn+m8O/5J4vKLAVWvgdBb?=
 =?iso-8859-1?Q?yLQwIz3QEPtlLiJmrbM+eYp4NjpgIqeUOpbkriVU7STaBHGr4jP0sicBBD?=
 =?iso-8859-1?Q?raq9dKV6LWfuBRnQbOskA1sg56MwrvjMvtRjzH6Ei2ZP/9wEhIp8nPIzwp?=
 =?iso-8859-1?Q?CDyP/wLMe1myOm9CubGwZuL6qz0lzO/6dsNWklnnc3dFUP/8QLJALrPm5e?=
 =?iso-8859-1?Q?/C0IFYR3Q3cDAnRBFi12NXhLYKcZPg0smhpiHNU92dBZGFFdoXEu9RNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8oUcXdiNurkWXzHajoe84QEtDD3vICk+QFh0AcI/U1nc7E9djse4F1lbokw5L1GgPbE3mG+dmavuX1T8Ilnw+U9fiob8KqzIQVJPk6UCrSDMZrCMwgZQ7Pipmwktw/3Y+pXWeJI0r9TgQ5EZ3+QY3RGGuCLOGeEnRcPHJ96LwvC81C6XpVXTMYGvTQRTPeAH5lvrUaxRlBVHCMVSDv6Ux3hCHvsBDtvXD9k7juJ3IJdvU/WITmqctz3SfFeSBS5SiMAlVHS7YZrED2Eq0CQm6nunPYz6VWEttjCd4UytBTRV64+bLE0ufGFlw8FNG8NWFuu82MRYIgoIwhL2pvHqcRqxtqy4pRfFRRK4wNxvwotTdPHKJrGi334Dwg9L+xBd4egWxih303LClxQh1tON4HwruziN6j40W4+ABFhPWPIi5e6ODuMkw7uf1B9MbCnyGYHn/Vw0KU7ZO+xfYHaBIUqA+x9aiqOtf/b7MpzDGh4lqL/ayQcT41sWngn7kfqMzY/XxPtUKpADixxNIFwiX4wxiqErLGI/g0o5rMaR/D91w0JZW/cCkVcgeE1vaeaJ7rReiVYzPQJ+R5y51Rt3HxzL00qOrXyARPbU7xAS2Dc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc1733d-de81-4d35-99bb-08dcb31bcaff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 17:51:53.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5seSEaxKUoAhLnIx6rzpDvHnIfcEJwRb7uASoAWn2GbXJHTGXSg0x6uhqgaPYobffPgZILQPLOxbGrF5HPfUKgzSiT6uqhB6dx50+8DQwdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_13,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020123
X-Proofpoint-ORIG-GUID: yJFTjEoioPl2i6loJE1Scr6izgFVGm4U
X-Proofpoint-GUID: yJFTjEoioPl2i6loJE1Scr6izgFVGm4U

On Fri, Aug 02, 2024 at 01:28:09PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> But has an effort been made to clean out the last of these?  E.g., with "git
> grep linux_banner", I also see:
> 
> test/unittest/options/err.D_ASRELO.kdefs.d: trace((string)`linux_banner);
> test/unittest/options/tst.knodefs.sh:   -Sn 'BEGIN {
> trace((string)`linux_banner); exit(0); }' 2>&1 | \
> test/unittest/tracemem/tst.tracemem.d:  p = (char *)`linux_banner;      /*
> first 14 chars are "Linux version " */
> 
> The nodef cases... maybe not an issue but perhaps at least for stylistic
> consistency?

I'll have a look.  I am not trying to be all-exhaustive about this just yet
because there is a higher priority, but yes, I definitely don't mind fixing
what we easily find.

> On 8/2/24 11:56, Kris Van Hees wrote:
> > Yet another case where lack datatype information for kernel variable
> 
> s/lack/lack of/
> s/kernel/a kernel/
> 
> > (i.e. lack of CTF, and BTF does not provide it) requires an explicit
> > use of the &-operator.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/options/tst.linkmode.r  | 2 +-
> >   test/unittest/options/tst.linkmode.sh | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/test/unittest/options/tst.linkmode.r b/test/unittest/options/tst.linkmode.r
> > index 4b453f56..acbf8025 100644
> > --- a/test/unittest/options/tst.linkmode.r
> > +++ b/test/unittest/options/tst.linkmode.r
> > @@ -14,4 +14,4 @@ Linux version
> >   -- @@stderr --
> >   dtrace: failed to set -x linkmode: Invalid value for specified option
> > -dtrace: invalid probe specifier BEGIN { trace((string)`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> > +dtrace: invalid probe specifier BEGIN { trace((string)&`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> > diff --git a/test/unittest/options/tst.linkmode.sh b/test/unittest/options/tst.linkmode.sh
> > index 4e28f8bd..07045fd5 100755
> > --- a/test/unittest/options/tst.linkmode.sh
> > +++ b/test/unittest/options/tst.linkmode.sh
> > @@ -1,7 +1,7 @@
> >   #!/bin/bash
> >   #
> >   # Oracle Linux DTrace.
> > -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> > +# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> >   #
> > @@ -12,7 +12,7 @@ dtrace=$1
> >   function mytest() {
> >   	echo try $1
> > -	$dtrace $1 -qn 'BEGIN { trace((string)`linux_banner); exit(0); }' | cut -c-14
> > +	$dtrace $1 -qn 'BEGIN { trace((string)&`linux_banner); exit(0); }' | cut -c-14
> >   }
> >   # Test different link modes.
