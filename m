Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182204C62
	for <dtrace@lists.linux.dev>; Sat,  7 Sep 2024 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725674637; cv=fail; b=NFs6MDik9kZvyMBFjeZkpO891Wt5NMEUojBI29Gh7d+iRkPTEbYkT+TAgUejR7sXcdA355JV9qti6a1iEPmlDpVoYa71HBpX0VVkGECXVu4SWksdfv9qVj8RFamPc0PjH/M0bd7csiZCOgklWSh+Uk1An/bWWer3cMQwDquKLZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725674637; c=relaxed/simple;
	bh=h7oROrKTC/lFbTWG/AAk1XYrk827JlMrP6jtzL2mf10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ry/TJ/MglsnbPgwpk9PTE5SW1Jpy7rdBn6ZSzlq0dB88Dg0oqfss1ksAd/tQ+CU92zCFbEnWT8XNp1qVEFBkOMpSHgeeivpqWE2wA67hHEPbDnsOIH+CTzVWhwJQTCHhFnkYww9zxNVPi+emHlD4bbYPvk1nq17jZ80bR8IjL80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E0tzH++y; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kw/e8teu reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E0tzH++y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kw/e8teu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4871Yaw2003279
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 02:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=SiliwS/Njk/bicBloqn2+9BMbOcuN0TvELKUyzjQMmY=; b=
	E0tzH++y/eAGQMkh2e0yVLOsQKYemUi/C1S7sv+tnYiTiSIxXEvFuM6VKI0h8JCU
	yywY70lNVZbaCWyMwWOyFpcFd2BvRHaQ5+XfI4pBXlbDjiyzCoV64hRxGOt6mCqV
	hQDffiCwgAbt9Hd2Cr63cqxXB+lku5Ac6wmdEj1HCSwGBsy2wL6YsvuGEX5o9KjS
	3SvRYX0vvlz8YqmhkKNVtOZP2CbCpCwqET5BVldDMNsQiAsDUpq33g0zX0v9GVAD
	zs90V3vXpRftRPjjAApO90Ndm+nBZpEIBzi39y0BCKJteY/C8VVAB64S5Zyqi2pw
	uj+hUWNyzUA6u++te3zUUA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gd8cr0m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 02:03:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4871Y3IE032386
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 02:03:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9brdr1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 02:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeX3TyoLGacU+Nr5aUsF66K4rOKjs9JvW4YdZXwinRjhRq5qmkLEVfixGSLCrj6PL0U2URzH+n5oXx2VaGnw4Vz+ffV/jzES7Gmq7erGqKmE41qjx5adj7RgszACc3GZ9MOAU58NsLR04RsrZE7cZsHE9lZyNliBAE5lcR/Rj1rlJ6Gi8zGj7K8wqPZzcaworiXkrBD81Alxq2+oNhjW7BEzOHHu8DPO+PDrFWU12G75TAUAS1EhxtPRK1w+ChIsZ67mBBeeqTeYpu6RDdWYJqsGHG8mh0wcz6hh8OR5MSPXe2+zgZMUC9QmqXI0eXj9teugthqTCNoNWPdW0d8t7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3rGKy3kzoqGITh//38ZLqPM6mSgyxSIjfFUa7ayZvk=;
 b=bZvlL7saLbxUn5cTeE6AJ0SqP96UWyIWrIgQtnkesuxpzV1iCRtGq2r962vBKP11h4J4qz0W2pMvy9X6UUTqEVfTVdRwaJIy4c2zxR0Wj+xiBm/LWC56Gf/WIHalOISxwRSQDU3LM2+9tAJ8UlkuV3FEAgPW0zp5VRuAP8pPA3C5llMstiATr4DlGvJP/LII5QoeKNspjbjwKbjJ46L6Td4+aamToeGJRlVv3BB2n2l0R8YB0miZtZDyyJhWJvh11opCmQh2/VrFvCiCJIERIP3AI6LFiiOMUrNFdG8DJws0iiqtXomzYTDRevqG9Sn5jIxFfPhhsW4QOSrnIencFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3rGKy3kzoqGITh//38ZLqPM6mSgyxSIjfFUa7ayZvk=;
 b=kw/e8teuJbIncsjB+blpOuLtshzD8Df399k7l+U6da1f9+gUeOQhJppCmztSVMAd3DbquH4q/WeBGKIDlXDmBC3tJRwEqbvtS1D4f/dB1AI1L5VjFstZMLgQfE6LRDdrLo0bmyr72YkpROcgmlgmfzRxvOM1RCaGlbyio+/N/Vs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH8PR10MB6549.namprd10.prod.outlook.com (2603:10b6:510:227::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Sat, 7 Sep
 2024 02:03:43 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Sat, 7 Sep 2024
 02:03:40 +0000
Date: Fri, 6 Sep 2024 22:03:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/22] Set the ERROR PRID in BPF code
Message-ID: <Ztu0ehrOeHqwIvmG@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-5-eugene.loh@oracle.com>
 <ZtucZiRk7G7UVktd@oracle.com>
 <d009801f-28e4-3b69-3f2f-ae99b577c1bd@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d009801f-28e4-3b69-3f2f-ae99b577c1bd@oracle.com>
X-ClientProxiedBy: BL6PEPF00016414.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:c) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH8PR10MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: f328f4f6-c8a4-4279-2413-08dccee14b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?AhhUgPlRxgW4hddJ4kgMMO/W73H9IQTTa33W5VKvjHG9jbML+oGEyO5BPl?=
 =?iso-8859-1?Q?+P8X/8p4CGXe/Cw9Zxhvt9thC3jVBCwf/oxyey+HZA82Q62uf7G+fLNpK/?=
 =?iso-8859-1?Q?qXX4c7yL3oa9qmlF8RJuB1Rkwdf/z91NFzoeYJON45yR0dRG1lze57PrcR?=
 =?iso-8859-1?Q?O/3LQ41qPE4Saqya0o7AOLwy/m/QFCSr/uJA/1EAYB8WQv2zSFvwMWxv+r?=
 =?iso-8859-1?Q?iNKXKIv2MJHGMaG5JdENLCyExnRHkMZDMJg04oyOxOXno2UCBb3g2swjUl?=
 =?iso-8859-1?Q?X4xpuNsz6R5W+eUopTS72ooDdB9Lu4fCvQVUVMUP+qTn+K7zON7zTWW/5N?=
 =?iso-8859-1?Q?VDAwEo9driHRjH9HXCWuolfa1lLgjCpSsZe0KA/qQSTNNupNh7lfAZrhaZ?=
 =?iso-8859-1?Q?KC7hhxELhsKwnRNY/YRuIYPnk/DPAuT0wmiS9rBIFKd1CLMkZ/H6koO6UP?=
 =?iso-8859-1?Q?y+xxOPnWFPpviP9QlD7mBjSRiKD4KJZbQwGPDXcnOu86xHbOmgMpPwvivF?=
 =?iso-8859-1?Q?PgfCdmB1iSLGCPld2RkBe5IVNi9cFdoPHWcCqHb3ZlOzOM//mn+dwFdiop?=
 =?iso-8859-1?Q?OQehfvvcTrkUevwy/2FUecPDDXMQRnGvZfx7VkazMWJYgYcqhGbGGITk//?=
 =?iso-8859-1?Q?t3eYeILnaIsmy5bsOIdXx//xCIV7SQ/btz6No053nmoDdetm05oq8Ebr0Q?=
 =?iso-8859-1?Q?GnZi/1V8KroPrVY7nsSNaJIl3Bp96f/2RIUU6vsl8RZoM0kozQOo1pJhMx?=
 =?iso-8859-1?Q?2hdfzMDZ8aV8cBi3xeV8KEhj8N2avoW6r6UIvQGxi+KHUFf7ErN4Kne8fn?=
 =?iso-8859-1?Q?TVjU5y0Gv32OB2rSX+48YuyImv+rp3Nf81es1RBScYKAXD9+DrGnb+WuuP?=
 =?iso-8859-1?Q?0g9LPnylfBnpUaqugVKMbCB9rHanjiEj6JLVXp3E1n2ZF6ioZH71HdxA/U?=
 =?iso-8859-1?Q?xmBQKBIaP2isMf7fQkoczzKP25zjVQyy17WtzxdqpwVYkXk+Ilwj+PYnu6?=
 =?iso-8859-1?Q?W7BUGXZYVpIeaDvMskYNshL4f8x8QN1BdOyz+uTaQxqY6p4/a0JAozxDN4?=
 =?iso-8859-1?Q?iOHYhGHsZ0EPRjeWiSe29KG1mh+Quhp29Yk1WbW6YTyjlr6bIKl53Bzudi?=
 =?iso-8859-1?Q?RdWHerCkH1xsigYTOrFJ2lJy4n/n919NCdQePEWGyQaEFqDBDXogey3udo?=
 =?iso-8859-1?Q?hmGiIbIBXnhbLz3GNS9w7gaPzHnbzetPJz3sfKC4SevBNR3uTvyh+1Uqc2?=
 =?iso-8859-1?Q?O76aiPl1uMS3/3RH06zup8S6Clm/9nniBnYbj93jDjvs5DEmVnvhpXGqMB?=
 =?iso-8859-1?Q?1z8PK/5ifWWdA52e6NWz2vEriIRJCWuv5rIhiOCKa7GMiti9OqRZUB/VpY?=
 =?iso-8859-1?Q?LjMKMnLW82jZ/+uqr4z7F5pAIRrnjuEi0q4tZA9iIMOSMwW3d5Ey8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0LQu19e2/iiRzsw4XvhK1v/0MWyi/JplfhHbBKDcfjaWvASPu4NosWVa7W?=
 =?iso-8859-1?Q?KJRmGzLfqAGtw5PV2ayL8HISU85MwfIShCs08LiFN2vCmORjkkmQp5pAAl?=
 =?iso-8859-1?Q?DEiYo9O01A/yyDEntE/THHieohgaMFcGPfn6wnLGVLWilaX5r14oYTQRER?=
 =?iso-8859-1?Q?DhD/X1CbOhFZVAISl4UjojDJYZhwm/ywWvcw0W1MsWeou9J/e/C/nGCWiT?=
 =?iso-8859-1?Q?bS64huuuNmFWzaam5lRlBgXCDA4zQM9icSrcNFJ3/1gcPw6Bz/T1TpW4R1?=
 =?iso-8859-1?Q?wOp0xFDPceyuSiqLIm90CzwI5uOmahMtBh9zLFEj+TqNqJW9kT4G1ej62l?=
 =?iso-8859-1?Q?9/K+P7s7ZPiUCts7duTtcT1woKHMvHhLFooRz3I15q1rZiTzTrJ0Dbd7pR?=
 =?iso-8859-1?Q?lQStsrvJ9YLoClBEkJ0ieQ31B5obe6CM3jn7BuGoqyxCrP4eOf3FufZcdX?=
 =?iso-8859-1?Q?MHOe5m1H6cnfXK1w2qVLX5gu+hJPijDFypyfRIHGuO+2bdfprjIO7qgEEd?=
 =?iso-8859-1?Q?7x5yvEvD4ZbuQzMpevWoEpwHkRaKZn5KKenxgavqducC58FL7PBN++oLxG?=
 =?iso-8859-1?Q?pqRPGXVxITY5fPiQMqbiEtxQb0dRz3A7AZ7uAOKjyUl+rTZkmPZQxZ+bpy?=
 =?iso-8859-1?Q?pSyzRkql39W1BSQkGRFARNhj8RQP9/Sc7Y23OnQqclA9BnZ7MoQ4WfNmQf?=
 =?iso-8859-1?Q?MnFIjL0EktNiVZN54fTySGa1nh0JvHH4k5rNrBYchh43D2GS/71h0L3axj?=
 =?iso-8859-1?Q?kjPcJl9sfYZXJppf1SWR39VQGGnTJIKLcW4B8IijXYV/N8F3RQRMUxHppE?=
 =?iso-8859-1?Q?wSGH9W01f7fFPlp3Q1gwp/Niml7NzvWBnWMSp7Xw5c+3fKrCh1O0W/UGd9?=
 =?iso-8859-1?Q?gyO5q7l2EQhA2/L7rlS26ZOfkyZyxWP7yf6biWH6d4l19kY2xUrzfWBa2N?=
 =?iso-8859-1?Q?dAqje5UMF+SfnaKrFGSmRUW2wx+pSk22XOvL2b3/GksXX9qZn1oFuHitpI?=
 =?iso-8859-1?Q?kVE6mb9Qpx52Auk3KdHLca9jvsm/vIHD2G91bgk3vD2NE5GtIriMNSh3SK?=
 =?iso-8859-1?Q?6gCPo58VRGLCnwHtP1TSTlKqdvbqIBhbERrvvf3iW/dNrgCR+1ar0kLCYg?=
 =?iso-8859-1?Q?PCWTpYrpX6Zx8vbYSa2gyDng33UfZrg1Yg8EhhngnFavECxYCf1fGq0llc?=
 =?iso-8859-1?Q?exOSi0uV8aPe7irzknHx8S+ZNVU7SsJxQfshHt7XYydJQasKZ89GN2sRtG?=
 =?iso-8859-1?Q?TXevibJZccwJDxOUSeKCouLqAMmr2o/8hoGToRhKf+YFa/ceG5VaAWey70?=
 =?iso-8859-1?Q?3unubPxjo7vnSxgSrW8o7QKWF+ZSdLZjEGGSd+S6dmfK082Sn7whkl6CIm?=
 =?iso-8859-1?Q?+RoyBy63e5dH1h+DB/RU3qxHzMrwV3MKf/kCEZ+a8O+fXU1dcqau8Lk3YX?=
 =?iso-8859-1?Q?Lkr+qx9L9aBGZUZTEe1gUAauEEFW0FzpMdnWHWm7JZ98GN1nQxG/gWQVf1?=
 =?iso-8859-1?Q?VhWbqFzScFg46NLl8+HlPfYxa6Pig2tZLwgLqGceDPrFqNyUejvGA1WZtG?=
 =?iso-8859-1?Q?npDhQOfFvrtBpTnV0aQbdIWh8zpqGCwB9vZxByEn334E8iP2IyO+MCl1Bd?=
 =?iso-8859-1?Q?xQQmvtzZodOzoldV6IwU9Y71xDPRF4q6mCILzaMVrzPQbtGtVXA2tCFQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0Ri/eFdFvx7oxTUdqO1bANUy6mbdBrnfU4MiGnYKv+rmXWLYlKJMmtemWfy7+/0oCfBzjKL7mUIDfEj712OXQNf4cbsCXr2yHlixWxNOvbldZuM1H+R7HLE/bM4yXvgtXn4TZMesvQWGpT6jfV368U5ZR0rjun/vH+pk1RvKJcN8GHp8eNoC6xZhEm0BPC1pE8jDWEhrdRwfR7brJ9NwiZ4MnMrP+eU2Sv4CE08J669c9O7RJPdQ1tiInLGa+inGc5huGyT673K4d8abhA1uZz6ClAnn8x54sfL5+95f07KFQRjBisGDdyfGgFEEQHMmw6pYRtbW3/OCO5ie8UGlIS12wD0s6kq2oVR+NueQsU49N7eoPwTlSfWGvrhKUx7FRpFBfIri2Vn8qhybuuWDc4m3vmTXDOLQcEEgJKSI6unNtEjTFYdbji99Goa4olItf9G1oyw7M3l6S4WN2P3Dv4AIO6gMRqBoJAOrLXhyuFsvHwA7Da6qsyMkLhvMwOGvG4vZYjiKvh7uNKg3Ikrxu3A6kMStTngjFyzP5fVVGBCCNwmpT2/zI2CWhBNAJBcn+VqAlys6bzHVcSo6wZ05RjgKgJBdmQiYMmPg/1WxWfM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f328f4f6-c8a4-4279-2413-08dccee14b65
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 02:03:40.8863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDeZ3W5BJZzFp1D1+kHUmsnEFYifnbq5s5Es7ywU/D2vwivPX4P6uoDqGibcwBTEpNTH+J0ZqaV38SCsdmc4pUud+5MD5vs6A6/PIDYXxdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409070014
X-Proofpoint-ORIG-GUID: PkG0bG23zwGRer4sQVgIesNcbbRY7W3j
X-Proofpoint-GUID: PkG0bG23zwGRer4sQVgIesNcbbRY7W3j

On Fri, Sep 06, 2024 at 09:25:12PM -0400, Eugene Loh wrote:
> On 9/6/24 20:20, Kris Van Hees wrote:
> 
> > On Thu, Aug 29, 2024 at 01:22:02AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > We use the fact that the ERROR PRID is always 3.
> > Where do we use it?  We certainly should never override the probe id that is
> > assigned by dtrace when providers provide probes.  Will it always be 3?  Almost
> > certainly, yes.  But the right way to do this is to actually make the ERROR
> > PRID available as a symbol that can be resolved at program load time, so that
> > the dt_probe_error function can get to its value.
> 
> I'm confused?  I thought I did this and you suggested simply hardwiring the
> value 3. https://oss.oracle.com/pipermail/dtrace-devel/2024-July/004989.html

True, though I didn't mean to just hardwire the value 3.  At a minimum, I think
it ought to be a define to set the value of the BEGIN, END, and ERROR probe,
so that a symbolic name can be used in code.  And that probably would mean that
it is best to add a check in the dtrace provider to ensure that those are
indeed the probe ids assigned to BEGIN/END/ERROR (and if not, something is very
wrong).

> > Anyway, the need to restore the mst->prid value in this patch also highlights
> > that there is a much bigger problem...  A fault in one clause contaminates the
> > first 6 arguments of the probe, and since a fault only interrupts the execution
> > of the current clause, following clauses will no longer see the correct values
> > of the first 6 arguments but rather the ones that dt_probe_error() stored in
> > mst->argv[0 .. 5].  That is a bug for sure!
> 
> Good point, but... a separate issue/patch?

Yes, already written :)

> > Here is a test that demonstrates this issue:
> > 
> > #pragma D option quiet
> > 
> > syscall::write*:entry
> > {
> > 	self->arg0 = arg0;
> > 	self->arg1 = arg1;
> > 	self->arg2 = arg2;
> > 	self->arg3 = arg3;
> > 	self->arg4 = arg4;
> > 	self->arg5 = arg5;
> > 
> > 	printf("%d / %d / %d / %d / %d / %d\n",
> > 	       arg0, arg1, arg2, arg3, arg4, arg5);
> > }
> > 
> > syscall::write*:entry
> > {
> > 	trace(*(int *)0);
> > }
> > 
> > syscall::write*:entry,
> > ERROR {
> > 	printf("%d / %d / %d / %d / %d / %d\n",
> > 	       arg0, arg1, arg2, arg3, arg4, arg5);
> > }
> > 
> > syscall::write*:entry
> > {
> > 	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> > 	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> > 		? 1 : 0);
> > }
> > 
> > So, we need the ERROR prid value exposed as an external symbol so that it can
> > be used in dt_probe_error(), and a patch that fixes the contamination of the
> > arg values.
> > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   bpf/probe_error.c                         |  3 +++
> > >   test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
> > >   test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
> > >   test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
> > >   4 files changed, 42 insertions(+)
> > >   create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
> > >   create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
> > >   create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p
> > > 
> > > diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> > > index c8ddcdfa..ee1a1793 100644
> > > --- a/bpf/probe_error.c
> > > +++ b/bpf/probe_error.c
> > > @@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> > >   			     uint64_t illval)
> > >   {
> > >   	dt_mstate_t	*mst = dctx->mst;
> > > +	int		oldprid = mst->prid;
> > >   	mst->argv[0] = 0;
> > >   	mst->argv[1] = mst->epid;
> > > @@ -34,7 +35,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> > >   	mst->argv[4] = fault;
> > >   	mst->argv[5] = illval;
> > > +	mst->prid = 3;
> > >   	dt_error(dctx);
> > > +	mst->prid = oldprid;
> > >   	mst->fault = fault;
> > >   }
> > > diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
> > > new file mode 100644
> > > index 00000000..59021c60
> > > --- /dev/null
> > > +++ b/test/unittest/builtinvar/tst.id_ERROR.d
> > > @@ -0,0 +1,32 @@
> > > +/*
> > > + * Oracle Linux DTrace.
> > > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > > + * http://oss.oracle.com/licenses/upl.
> > > + */
> > > +
> > > +/*
> > > + * ASSERTION:
> > > + * The id in the ERROR probe is 3.
> > > + *
> > > + * SECTION: Variables/Built-in Variables
> > > + */
> > > +
> > > +#pragma D option quiet
> > > +
> > > +tick-1s
> > > +{
> > > +	/* trigger the ERROR probe */
> > > +	trace(*((int*)0));
> > > +}
> > > +
> > > +tick-2s
> > > +{
> > > +	exit(1);
> > > +}
> > > +
> > > +ERROR
> > > +{
> > > +	printf("id of the ERROR probe = %d\n", id);
> > > +	exit(0);
> > > +}
> > > diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
> > > new file mode 100644
> > > index 00000000..95974abe
> > > --- /dev/null
> > > +++ b/test/unittest/builtinvar/tst.id_ERROR.r
> > > @@ -0,0 +1,3 @@
> > > +id of the ERROR probe = 3
> > > +
> > > +-- @@stderr --
> > > diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
> > > new file mode 100755
> > > index 00000000..884b43f4
> > > --- /dev/null
> > > +++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
> > > @@ -0,0 +1,4 @@
> > > +#!/usr/bin/gawk -f
> > > +
> > > +# Drop the line with run-dependent PRID for profile probe.
> > > +!/error on enabled probe ID/ { print }
> > > -- 
> > > 2.43.5
> > > 
