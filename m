Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DDB217F51
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729891010; cv=fail; b=HaT1SjjfMnYo9JJh2XEfT3vpm0EofNn8FKyTFxet7RhBkSh53ZETgbX4deYbxd/aHptZmcZjDRoVnjSEjFqVCUDbTZemYv5eeZFAukkMi9MULv0Dq3dE27B4sgb2fo14CKkVrmVsOOyiGhLBx4UsnsC4dx+Q4cy1+KZCTpmccEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729891010; c=relaxed/simple;
	bh=EvWc+1IskhoGF0YUmBToWXZHsZDiG+AjRAefc8Ay8yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UM2S4wI6tZwsUTpeC1OXBSq9GqGDMQYneXpBisZ5hs+lNQ26uZw2I6G42hQJlEV0TlR1w64dVRpEd4qfxrXA+4WZ3DGkXZAtEJbMW3IZV4yvIrkEBgHCFQTwSPXqzxwyZHuRTRcWitMzm+MYJJU+ygE73OSrNp67r6QuxaW+XIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J/m4zW3q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cl2sxSZj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J/m4zW3q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cl2sxSZj"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdVEJ020763
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=HGQm2c/yCJXAu7yxqg
	WKeMZ44HA/G0Pwp9qfsbDlMt8=; b=J/m4zW3qC7idWssQj/yxqoNOqlFLndGDtD
	oPbNp6PhiILIp45dErsqD7uhqtesRXszBlBfwvcr7mufZ3dNWVXoqsIQFpr13Jc7
	UONOA7Q2qMxI5ypFzjE2rTFqVj2UdugNC/WFNnlUuZfkl2brTbV/nLI6ELyNINUX
	n8ctqAPI0xzJDGSDWgUhXnh1vvaWctTBVBL+8PODRU0iMxuFuSPGRk/Npd1ISnHP
	1woX/ahQlGgND62Hm0poyHkPRM+FbSCeaQptffJ7pWvGhiqQhD69Kjd372TAXWCI
	Rk5Y/6NADyK1BxUY+iQEGvHgq60n5ALMcUMw4TAAsjGWkNREIRlw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkr557y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:16:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJYXTK020976
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:16:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhnvqgp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HG0uWtJcL1DYqxEH33NHy6JSpz9MzKWcyNt3SMzGDRd0t3M62qdWptW0g8S34FBtGxiwZKI5se++dWI9G96AgxL2DOJXLfuKzaCWlwmRlf0h2zqaWWp0Wyn/VQy5mSb6zQA+B7DOvvr43Ak3+wMj2X1qK93goAGSD9JoaAG/7hDib3s3g8uuSzoqiSJyTXLFLBn8asN/tOpe+pMm6UJY4X/Oqsc88L2EBrhwA6d4hNKYff5XxOl3DQHI3aFO/LotHgan/WhTyzffBkZv2+hXjbuQR1nw7a1ozDPkEH+1pAECNdxSlvxG5bC1Kuw2ppXXj1gitybHTkee98wsq0U6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGQm2c/yCJXAu7yxqgWKeMZ44HA/G0Pwp9qfsbDlMt8=;
 b=vaOAGEtVaov2TK4byZH8SowNU0B9Ti72g/Z8N7esW5vEq4AD5fTFjaT8jDJefzC3koBHqyJ8Wv3+zLnVB60YIn99/2YerIhqKQogfQYDw2osF7bg3XLWFO5b472wQn66+Manj0oE2YNgFNRNgW7nZN7TQy/yyGSvv76KZOnlNPGCfd3WrbADEUaYorWwV+TUYmAUDSMxrkO5GdxEp6P4Hy2nBSfJmZ2taFy+OwkMdrYM8LzXfzN62OOEga7fT0y6LUEK55NVE0UdXwIhaHPoag0Nr23TeR1fBYCC3CR3r53d4rJH1i3Zk4Vx5NEZlx1ehTRpOllKGJDgKGZjiAnVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGQm2c/yCJXAu7yxqgWKeMZ44HA/G0Pwp9qfsbDlMt8=;
 b=Cl2sxSZj+Q54jLM+lW/uH7k+05gDexiPxtYXVliqEQXSFMaIBoBdbwCgqHoGutfEgcqHn0W2NkU1RbAlCyB9HT6DGqsmoPXnUneyzX6INorZ7qphjJFb5L4PIf2QB5tcjKy6RVCCOB09oxk6qwHD9HzKLfPYo6e1E23xm5O5qIw=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MW4PR10MB6679.namprd10.prod.outlook.com (2603:10b6:303:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 21:16:42 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 21:16:42 +0000
Date: Fri, 25 Oct 2024 17:16:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] test: Do not depend on ext4
Message-ID: <ZxwKuCIs1atplKFL@kvh-deb-bpf.us.oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
 <20241004044355.25870-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004044355.25870-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::31) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MW4PR10MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: d4695c2e-ed91-4c4c-d8a0-08dcf53a52b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fesFNTUuTy0HOV4ce7RTw8ACV0vVSyJGGg0xrcSTbcEceLtAYpus/Ix79i/7?=
 =?us-ascii?Q?VbCzDjrdHiq3XpywFPpcpWkOznKtbCvwRVirzJQZC+jknP5xMnT4ysH31bV/?=
 =?us-ascii?Q?Z6LTwPVV7Y5iXYkLrEfq+QrgXtP2Ir3j3qWwMAhPERU4NAHNaAshSCmFcqRc?=
 =?us-ascii?Q?SMWCZUkkyXsPYYBrHzFcww1HWa8SGuzi/pEyNMbR032uKOWJ7sdzcr+Y4tIz?=
 =?us-ascii?Q?XeeR8TYXvONnS+of4FZIFGe3AR/ftgAYXSkwr6qLiKosa4Pz5QLU9NaMG7T6?=
 =?us-ascii?Q?IPJjVWmvHq488MjN0McMAZLUr/2H+GmNjK2yUMYAW3jgYlNLGcsCSVt4a3JE?=
 =?us-ascii?Q?foRZ5B/aq0nSrhGfVFQNrDVD0UFb3Ju7iihPgVZXrHsSqDz4ROpzx4DvZDcx?=
 =?us-ascii?Q?zs9heZhHER7qvjOR2ihejRggjVqEJeuhoRyDAOPlGAMzcj53mRlYPJt2KPvA?=
 =?us-ascii?Q?INOoQFrts0bSLzpoLgoGTJ7sn1tE90kKFiJf7tUMAl2Xwrm+JZprP15uWhBV?=
 =?us-ascii?Q?dmehCktAvQWgyxwHKQGiJ6Iw7xyP4uuG9+lv+P5GzCwIY92kYv//TrCzVFbr?=
 =?us-ascii?Q?ZXDdwpZqoJ24mNX6eIEPRbOs3dXkVa9DMk/WHw3R9dkcOO82p/QYJNteLnVb?=
 =?us-ascii?Q?sVCqPiMhwtxYNKNm0g6cQxYjGa5678nZIh6U/WZrh2sBi6hWLzo5jW82GYTp?=
 =?us-ascii?Q?X+KXYWKxJX3TWuDNhleCwKQrBEA2CNSEBOW7EzgyIi1csO4U1yWD4dZ7mB/o?=
 =?us-ascii?Q?qw3KIxbxaVUH5BOQksPJDXKhrU0M6pUvifRs1TMNhjvAJnueMu6L8IbHd41X?=
 =?us-ascii?Q?l9WqlkpMrt04cTuXN3hbHgaRghQKV9DpeLJo9tBQlUUt4rxh6HNRplnzZgWQ?=
 =?us-ascii?Q?qrFH5X9s77L98ACBmDUnCBa6Eh8UD+XZaPL4OTQliHYcpo+tOfQFlTdC4X/E?=
 =?us-ascii?Q?s+h0RJw0QssEz/2Mi6pklGRdH0vwdcvdgd4VGEtGY/x+NwyHrnnE2HsRXhCE?=
 =?us-ascii?Q?CdU3VVJHR8ecOY7ROuhXBO/UJxYalWvwzITyJTv+z5b9CbgweKYO/EN9/rbl?=
 =?us-ascii?Q?l3doo2ml8BnU+95iIFCmTabd3m7d/RerwPqAfsXa6UxCQXPTF/3RcXtQ7gGm?=
 =?us-ascii?Q?KX5CxXHJraHvyyZ8wB/AotxfH1MncOe/jOKx2a5QCC3er/KxmB5DUs9wZb75?=
 =?us-ascii?Q?Uvlv2vWs6kZpERtGk28tBQim1GS2n22Vt6T8uS1PK1quEUH7ykomOkOjWOE/?=
 =?us-ascii?Q?EOyEQ6tYqPYqmY9hLkVnvN4jMQ62pxTpTybIyNonWzfrxWBWEz7c95TV6UN7?=
 =?us-ascii?Q?LffkfRs3ynvDLrL/h6nO4SaO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0QHEYh6KxW+MbynSeXdHzGE2TGDMBuxM36Hr6kXqnjNJwAUFQUE7ja+WMvVx?=
 =?us-ascii?Q?voraNN+fboV9TkQQN8JEI4i741j0NBKR7VORGGIO/mdaqA++Z+EwaHm6OOFQ?=
 =?us-ascii?Q?9U1KjCBMM7g/dE12U8jPjT7aOOq3Cy1c7s7jbqILMoJSx9fBER5EBPMChlia?=
 =?us-ascii?Q?sU9DuBgTVgVbigbDhvrWgu/7PJJkFwcHh/Gu0xhKiM1BlF2orOVjOAMZluCZ?=
 =?us-ascii?Q?k/MTRDFnfe3Ptcaf0RXJgPKbvP8ROcv4bu29obJP9Ar4T8J/pnCciSjBl0Ut?=
 =?us-ascii?Q?awdfa267rC8fPSI5R9ZNnJlRqNCoFGlGV8YxhD9QBiah+p+2YobosMRvAeMA?=
 =?us-ascii?Q?XeUOa9KNByYe1LBJMZUh1tREX9vhcw2bPSj1K57qNpgrH/bxDUnka2EMEJZ+?=
 =?us-ascii?Q?vS8/3x46hmb69xbrIZwRELCIsY0Fi+n32tcrZxJxen2Tr/8ZupiR8jWkmxym?=
 =?us-ascii?Q?+Xpigmzg/+I3nImTLRnQE34DNQnx6tOSNhVyIhq+bWDNaQCLyi9Bg5v3zdUE?=
 =?us-ascii?Q?hWXXEFMDFciE4vxtVGiNIxzYhWRqxFfdu1C669lg1Cnk6J5n6yKi/ioA/UVy?=
 =?us-ascii?Q?/wrt4vDZ1HT44Uphp7bPm+MiUnCWbr/e+vinWm9Xkl38VcsqOfbTBWE6hVrW?=
 =?us-ascii?Q?HVJ+JEdx5zNw1/QbPqn9ny/EY9E7/XTzV1/OhtELDPOSexFmIDheTzB5I/m/?=
 =?us-ascii?Q?0EbZ1+W3Wn+XrEc8EeGehB5bI/fUc0DyzDHW64R92uARq/jh4YsMQ4Ksxt8z?=
 =?us-ascii?Q?a43Hwn1o0MA5sXuc/ucUf5w05vWHR0CQgNn2Sw4MTI6qi9Tm5lR6YLVXsHLI?=
 =?us-ascii?Q?9NUurHOsB9vMqBJ6BqDQHatYp60yY0bs7U7H/8iozI8wjQ0GB8Kw1+7dcWFn?=
 =?us-ascii?Q?XPQkttl/0i5yHvHSRupBoY2ifX02iMpA5yZGSbXiv4y76DXLPG240l0iTfH4?=
 =?us-ascii?Q?KrInrJ+F7n1YDxuxn41v/oLzrEAonFMSpdrGCwjVnEmb7MkbauBWqvu54Nxg?=
 =?us-ascii?Q?w9RSqP4e9bRE3095x3ylNJvL116++5NsD3qTsMDYzV7I2T2M+NV4tP6hFhVt?=
 =?us-ascii?Q?+uTPqmzxm9QP16uDheVaYr00kigXsYQhpbb4/By0ADkovoOYxQbK+oSexl4o?=
 =?us-ascii?Q?wfbhS3IJHV7Q77465XKFQVuVfd8AbWbf499rmVujP3bKRAyO78de5Qy6vKjw?=
 =?us-ascii?Q?/SprMeAp7e2mpiXZCZsAyyC4ThqyzOA/+VVuBZ71/8c0o4gbr20SU4kWLuCT?=
 =?us-ascii?Q?zCScJKnYgzZC9Ux2/fLOjiFZEN0auB6wWxOjUmhHA2DOh3IvjTYsYLqjNun8?=
 =?us-ascii?Q?XvtTXCopS94kGkTrjDSL8O5HOhwffdF7WJxziYWwQ2Djhmjdsg2DZ4LsyHpH?=
 =?us-ascii?Q?jki5gzX35jHSYFN7//huALFJfnB8FQ8pO0/GKIBJitVzWa8e/M/oUkW6OJLi?=
 =?us-ascii?Q?jFsTBEpGglGJfQa7DlzzSgpERZpyLRhFJwaUEeNtk6bJQtuh050pHZcmjUwT?=
 =?us-ascii?Q?qvOXsucJerkYnNGldMAOggnXSD1YE+iCnVPallu62JaFgr7HVCbNtpbpID3J?=
 =?us-ascii?Q?CC9vwBqCuAmm5ZFLa/kSMOA30rtg4clmmfjTpYm9c8lvE27MGjgG8TiRVBJg?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Csysmnl8Q9uD4Bj8FgO00kSeGXga8UYiTizqSJeTRmocOC3HBne03mlrlYa6pGxm9qLET1NI3iqnmvflEqwkpNDUSq53Z8a5gqkWK1nF0tzjWT/ZEdxy4D3qezyGgha8gsogl/hPxcnow7q8LDAIJuFb3xku6u8SDeaDQaIREo4ZvHLvXXUYkZwk+KNTauFFrL+lXtx3Rec+d7mSxfxkQ3RW3RboF6k75dHax2xMvke3PXVSB5kgIW+zcxNlFXbpapq+gudEiefBm3ww0S4j6Nt6GHPWrmQl16jS2nShBCusyYNQfn+l2JQmLtik8R/k7uwhYus740h+NBdOWv3rwrnGpsCISu8qEjP1JMKdeXl/wRv2M7kDmApPTzWGunHap3KzyS515zNv6/PX24TGLjw2dXAvQSFniHojBdmNGjK1l2qiv+gCL/0KQ5RDmT+mw1i5w/bMhF3VqS+zZDMRDgkccMr0v4uN1JXVwj5fpcDgW/tkIfaAnJiJdqXO9bI2XniyUCK7ic5HHkDce01HMCFC5s3s6kFytSrks7CKUMqM4WoZ3JT00xwTMNffbObbJK2WK7jAegPZSmDBnj6RLOSVDWri3u6lCnv9UzeZnjk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4695c2e-ed91-4c4c-d8a0-08dcf53a52b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:16:42.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDMamKtMGiYaeR5cW+e8M5AijWEM3W1R5kwJrTOaaBF0wJmfw3ZX/q0rnJBDDD9l4DoqTNglKGoQbBi+tqhWyq6M+YzsbNCaHe6ghI0PJ5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250164
X-Proofpoint-GUID: HTRgV61iKOHSRSSwKi34I6o7N_nH-MwB
X-Proofpoint-ORIG-GUID: HTRgV61iKOHSRSSwKi34I6o7N_nH-MwB

I am not too sure about this patch...  We are not using kallmodsyms anymore
for newer kernels, and on older kernels that symbol certainly be listed as
[ext4].  So, if ext4_dir_operations *is* in the ext4 module code (compiled in
or loadable), then the proper ref to it would be ext4`ext4_dir_operations.
So the test should be able to use that - if not, that seems like a bug rather
than something to change in the test?

On Fri, Oct 04, 2024 at 12:43:55AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> It is possible that there is no ext4 module, whether built-in or otherwise,
> even if its symbols are present.  E.g.,
>     # grep ext4_dir_operations /proc/kallmodsyms
>     ffffc45a59d9ee88 100 D ext4_dir_operations
>     # grep -w ext4 /proc/kallmodsyms
>     #
> 
> Meanwhile, in
>     ab883bae "tests, io, scalars: use kallsyms instead of kallmodsyms where possible"
> we read:
>     scalars/tst.misc.x needs adjusting to check for the presence of the actual
>     symbols we are looking up, since the modules might well be built-in, and
>     thus not show up in /proc/kallsyms.
> 
> With that patch, in test/unittest/scalars/tst.misc.x, we check:
>    -if ! $(grep -qw ext4 /proc/kallmodsyms); then
>    +if ! grep -qw ext4_dir_operations /proc/kallsyms; then
>         exit 1
>     fi
> 
> So it is possible for us to find
>         `ext4_dir_operations
> but not
>     ext4`ext4_dir_operations
> 
> Change the .d script to look simply for `ext4_dir_operations.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/scalars/tst.misc.d | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/scalars/tst.misc.d b/test/unittest/scalars/tst.misc.d
> index 60edab45e..6a5f4ae2e 100644
> --- a/test/unittest/scalars/tst.misc.d
> +++ b/test/unittest/scalars/tst.misc.d
> @@ -20,7 +20,7 @@
>  BEGIN
>  {
>  	printf("\nr_cpu_ids = 0x%x\n", `nr_cpu_ids);
> -	printf("ext4`ext4_dir_operations = %p\n", &ext4`ext4_dir_operations);
> +	printf("ext4`ext4_dir_operations = %p\n", &`ext4_dir_operations);
>  	printf("isofs`isofs_dir_operations = %p\n", &isofs`isofs_dir_operations);
>  	printf("vmlinux`major_names = %p\n", &vmlinux`major_names);
>  	x = 123;
> -- 
> 2.43.5
> 
