Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E9208AD
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754406256; cv=fail; b=AHehKLAMvaeWtHe5u1dGbTBaiJckejNXGrvNeemwIDvghlqSHkVHHA4GjrsbEimW3CVAZxl2Sblb2UGl55sARuG/98lYgc2iwcD5s9Eks7EQn5dG6AFcfGI/4bywLGpaK0poaOoP2AhFVB5CSV6h7JeqmNXpiqvTzVVYSWENUgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754406256; c=relaxed/simple;
	bh=l8XSAr8dxltAZ/nLTH8bnKHXhuhavoy4Vr+08V22ssE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jFHQBAcmoonEgk6hJsIQyWn4pHkm475T+q9biA0kAFbPLbNB0UTjCTUWfDo5nT/f1Iq60E2dFqXN7l1jpvIK58y+o6WaA2isdl9BpIwMNgKN2wbPeFvnAPwBqAJ3ks7QeHCBIK2UdQl/39qqhlIO6XJgX2U4LaynJ94JscgsSHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dk87U+Dd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rDLbWBfw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dk87U+Dd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rDLbWBfw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575EpUKG001499
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 15:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XEKVUB3jZqT5D8Xw6F
	jaJ5Ry2h20RWC523qDiPQt2j0=; b=Dk87U+DdJ37CRXNhHlVXuttaqw+QHuPeJI
	wP06DQQ6upebZTSCV+Rmpxr03+hk+FNxJZjOqMlX8yvJ/iKdt4SdzEgngo7YEngA
	xN7ejaG/SuKzHryrAkHKFrLobXkDHVWWjuoJVbMkYZx5cJFzKWx/OvCleYhJ6W2a
	bs38dMr6N1mB/1Jm3UUWMZNeFIDpgbv0v+PYKe9+92XgUjELmUgsQd0DbyH6V7ha
	+hSN+EnIqrwJxrG/rkKYbfZZwB7PiPosA6TwfEz5V94RzpjryGF5EwLnoDF3OL0c
	Vcx3rbFRAFmmwpX419UZg5LF2oEzSqPPX8ACpC+rGU2eR3lS+m9w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 489994n134-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 15:04:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575EkQq4039916
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 15:04:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48a7jw1v02-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 15:04:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgsXoI0Dk5YDItWr6a46r5R30TRgSMWc+arZEQYzEGk/5OEdoOZ9K3LwgfqUQcY+NNqk716j5MXpCOb4dFtRk0Kf4VRBk9vzXTvM5TTzqBBaw/iaOrvHj5V9tP+i0/McvDNh5khMUVoC20fMPIBP6ZgkH1BfjhTUFmCR2HNvQsgcBr8qyGeZ8Kk9qrJXsX3JIZ3LhcHIqLpEKOVUvvH98Glc6YY/hcZoUUOGkBl1s8S00lyFbBU+uYeV4Agdwu7ejYKSF+FnoqzMsR74qpnQADyS6TxNDi1sJCCEiB7m+KJh/PZfg32apQSpmD/bISe4irp9lcKPdZC/fYPdUzHfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEKVUB3jZqT5D8Xw6FjaJ5Ry2h20RWC523qDiPQt2j0=;
 b=cwZ/ZOl2FGxy3jEhLw94JfBLKIr+aoDhFPgONr0o0yhk1aqLb2jC9GA5qShoX2aD2TK0lqgYSwhXq+SjYOAtTAH58TxgBVO+uv+FJuQZQCgYroigIpDYdpILql28pR5TfTqWzg4uBQ2JJpAnqt+zw3+QprCifmvzTNbnXRjWzfi0bWNSIfAQyNYHeqTMNCQ/8kKcex3Fedn4NuoUrjkvM4I4F/QbP1NGbB3NtcoY1/Tkk8RGTG29COTklRZSUzdGuXkgP9XzkciYT1mBx8hgu365Jg1YRcgOG0KqAQGTCLiRrpQbSetfNpMGtHBNeLfACmq3eqlgCOwogLobsJykJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEKVUB3jZqT5D8Xw6FjaJ5Ry2h20RWC523qDiPQt2j0=;
 b=rDLbWBfwtZJ8pEb6AtTzkHlNubA/3iURYwy8U6QzI1JH3I2NJhx+YwJCzhExuRYeBS7e9TB6Oj4S99Jv5NXLZ7mNXcBu+l71clHv+CCSnC8aUjXolkw2dIDXU5j9/vy+utzuGhsFcoE2tjqx6QP+nymrS3xoK0pDWjTZutFdgaU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB5818.namprd10.prod.outlook.com (2603:10b6:510:140::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 15:04:06 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 15:04:05 +0000
Date: Tue, 5 Aug 2025 11:04:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v7 1/7] usdt: have copy_args() count args while parsing
 them
Message-ID: <aJIdYmQRtsyB0cEj@oracle.com>
References: <20250730090148.2141954-1-alan.maguire@oracle.com>
 <20250730090148.2141954-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730090148.2141954-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d7a02a-6bd8-4d81-3a46-08ddd43151f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F3HHh3WNfsZTGya/fbbYYujuJVx5+EapCvRPTPql5P7nyqeyjW3NsMHhHiRa?=
 =?us-ascii?Q?QaUYffCImnscjuBtc/YnLIN/FhswGl/OEJaimWtdMkkBEULlTE6wHak4+3YY?=
 =?us-ascii?Q?9rGwiHFqmom5lubNSwcquoRps+9j6U0S79w6c4vPewHD4I4b2BKYXFAumkWZ?=
 =?us-ascii?Q?2S2H/hU4/M0IulZIUlaP4GZscx3ygb1iSZ7c8AF8ODXNvpOn6K6YIpB+sSxH?=
 =?us-ascii?Q?mfD1ruIBejtBgW4yQoAsYi/LfB21dbu3n8K7E4ddMc27XHP093oYQIUXprku?=
 =?us-ascii?Q?ZagiJW4uEeoOAVl+kkBJ2ILkyeEWYtXh845glh++7Hw11iMIne2soch24e5V?=
 =?us-ascii?Q?2pEZSiHeXuB/B3jrSdUv8mtFmbY1TmuAZb4GDzGoiJoTxqgQkDjaAk9T5HvI?=
 =?us-ascii?Q?fKxvAZkELy1bYUMX9+NKPBN983DQ9GittOW6tYIc4dxOUckenToOcRtJmsYb?=
 =?us-ascii?Q?AiQBJnXJjk/IU+KRc+qaBkUCD3q2eaUUBJkdvRfdX2r5hCYY0vX/MWMsCxFb?=
 =?us-ascii?Q?vLep72udOOEQBwpVqWyErHGtj359mwXAiT5+fXxdFQwb3SHpnAFbW4yUauZU?=
 =?us-ascii?Q?E4sqH7XJUdMp/pSb5W89qVY2H18Qs2oBOvUG5MA8Eq/PvhsZhWky212B4Nzm?=
 =?us-ascii?Q?MtDzbouINm6GMqqzzcrqjCVRPKzPInEWHHoYTR8SED50yulaqaeUOcrHbTs2?=
 =?us-ascii?Q?KHxe9CEGAV7fFJondtkf3yAy9Av9kVD5JardPmdFNxOb6nTRxU7Qh+T5MYkG?=
 =?us-ascii?Q?ugkOflVU3y8wPtU4TqgmxJy5GqiQq63tc7rrSjympAkv4B+k4k/PqNJjoV1s?=
 =?us-ascii?Q?jO/lP/qI8tGrykBs5JlvPbBkCFwHF4gr2ZjsiGuwsy3y9/4gIUhtaNzNgRLm?=
 =?us-ascii?Q?oYjVKnXhmC99Akgeq8z8VhX4dy4g/HpByEm1p/Kt1mM6DIrTFTQR40/5e0uI?=
 =?us-ascii?Q?50/0ymA4Y6iN1KPVHZMOpEHGIwXaSudqUDep0lB0kHks6m9JXCgkLNAyc8i2?=
 =?us-ascii?Q?qoZ/RKil/sKIfbDNYHTYFVxAFSKZMUkhYaX4bgIh8TPqPvl64nyvYtXGbMQX?=
 =?us-ascii?Q?HmfcqURX63zpyT1YN7PBVPJ9b6oM8zhKGZ66k54+fo1P9JiORm4GKvHPn9cZ?=
 =?us-ascii?Q?VU8EwrKfuzNzFPSNFT5zO2RfKJsskNpQ23EIeREsuEeCXqGN4FG+bdmFxqGB?=
 =?us-ascii?Q?RP2oBbeL+Yq//43s7BiAIxxihnrPSfdcN0dEq6UqNbS49DVUSbOlCTygxM+Y?=
 =?us-ascii?Q?73hdZV4dh6MqkA55AZdQ56fyKb00lwf5rb7/MEfb4C3imtthKyedQQmIMK+D?=
 =?us-ascii?Q?rO5w88KsT6zEDagAukuqIQ9gHE2xkIYogk8jfZuglcRQbARqaGUQqV7s7QNJ?=
 =?us-ascii?Q?ziz9MiRjURQj80BwCjyjvxNYpoI7o7dVYvTzmvpIJg0mfc0Q34hTL7mnpVo1?=
 =?us-ascii?Q?JobBXQ5HX1o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/tKzZYRsaUQaoItX/Fa+w6Re016ivcDJSlKLIKxfpZ4RpKhDsvZ//ZU7I9jU?=
 =?us-ascii?Q?3qD7znGmQEQOdZBK8TcYFEsPv3kTrTCVfjcTPWIbfqI1P044Wc6HSoz9Zhbf?=
 =?us-ascii?Q?HDtFCiVR2//6CZNcRwvgiSblRyaNe+/dMsclRo6vtHzseF7Vjj5ddVduwe3Z?=
 =?us-ascii?Q?+KRC8iVJEiFsft0n6MNwVlCYdlJoJyaNQlHmGwyKYNUmETWWFAnwvrScLALh?=
 =?us-ascii?Q?wi6BXnQNA5phW8wGsfZcdG8+iAwma6czySvc42HgNMCNSkOLHdy13PhgpLnu?=
 =?us-ascii?Q?3i2sOe2PfmkiRnndWw1CTvyfPPJWgn5L7N0paw2u4NjqFS7OGRcrSLmuyQQk?=
 =?us-ascii?Q?ni6tNfO0OU/kMqAccwCqJ5XxxEFkxuCfdk4DCLombnMrjrTQZULS7zfStGAo?=
 =?us-ascii?Q?xN6MEwfYz6RsRN1eEBauQrAZpSbaozx/7TsblO8yAzzv2ZRP7wlp+/TGIEtJ?=
 =?us-ascii?Q?lkocBrd4VFgtMcrcxucTzk5K4wWXx/43cWKdkQW0sNhRftyHiBLVCfR+5mkg?=
 =?us-ascii?Q?N6QJkrt+FMkqR4a9spUo8Yeo/DprAk+klR9ef5wqrOSlJHO8JK1DhhAhoFxs?=
 =?us-ascii?Q?vxQMclfa1uvJSrF/k3ZAg4EN2E9Ua+r4lMZ39zxt/xCPcow0lG5WyRMxexgq?=
 =?us-ascii?Q?t8IpHykN5T6s8czGX/Een4paUIszXVO+mGSWCoiDfC/BHVcdT40jJUmdSwG6?=
 =?us-ascii?Q?EEaW6I3kNJeZhohQM0ZMow8Ti3WdRShEUxdxXQHVkA+WCJvk2fljrz8TgMvy?=
 =?us-ascii?Q?6fK8kew0IsBTs7p/wTa6FXults241DKIJ7guV8hpugQD67rs+COqqo6StwqR?=
 =?us-ascii?Q?Gl7yYUMj10VDBFWDfauq52Scv4ETP8KfnVL7/UlPXYKlVNJH6101uvUGPC57?=
 =?us-ascii?Q?8qxzg+3ZvqQbsWG/H0aiHlUMtH8Ku1gQo2vfWaLs9LYPe2XcDZHmQbmqkhoN?=
 =?us-ascii?Q?ra5uDO1YuE7ipvBYHzrPFN8j2rcpKs8P9bL6a6BRWDmpY+4yTZynlVGgQIE6?=
 =?us-ascii?Q?RMKQjcuGtGd7+yPuOtyOuy/7YyH5H5bO3bc3n9v95nC1gmQTAJniPj8G8bbk?=
 =?us-ascii?Q?O29ieqv8qOfPWPBOTuAHFOBmgX8nb1z5eHsjyZ7NYBBqN2kND+1LYxITt8kK?=
 =?us-ascii?Q?8EJ5Aem8svxFPaZ1x1792RTI+pNatFzewjGpheharZfguXccJ07DugSoaPbo?=
 =?us-ascii?Q?djciGvpiFnaV+p/texTe6Lzj8qR57f+4cu8uGhVSh1SfqA9sRp+eE1wRbnhk?=
 =?us-ascii?Q?4gIsi4PqrjY1aULNseXczfk1gg0uOr2N2pRtet0lbVDxi60n8goVMWGr29QS?=
 =?us-ascii?Q?jm5YkGc8BF97j+3uCap3PiS8zeSWjRghroQcJvjE+d5hW7EytXjY3IQqqgp9?=
 =?us-ascii?Q?cAgtO7cdyl8ZBXRIURElOQ+su+wtz0pXReosng/BmAvxz/WZjIrFzGy4Ar47?=
 =?us-ascii?Q?QlxL2uKcfa00Q+9pj/K+OQxBJscTrUiUCL6NDPetgcVNS3lz1gYad0fjlfZP?=
 =?us-ascii?Q?HcKNUp4lBG3mQty2G3ow5ymVlZpCpQq9a1tgBsvf6ULRz70ufewXuNrin0T3?=
 =?us-ascii?Q?fQYc9b2w+1Z3UaR5BWhDuncNu17bqLPo+yMTIP6+YCVknJb4uqJWTjreHd0s?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xrAsPwQFrbib3u1vOHZUC6fQXY4XC5Uxomgt791nheO/Mje6dRDfUSXsd+4l01mANVIcUFpkk1Jp10x2tLmjPEeh8uxVrIJBVrE0BV6R+VaHy9rk+BGUptM7UHge1udUHiatSkUhWYN9VQFd8wLRGxYx7Nqge0kbXCCjRqezJullxrQeCg5KiDMsq6bSzh8UUEHKLG8hCXQa4sVjLZDEpJjMnVUXK9ViBzyEpxFY0x0xRQuvWBAYwx0WiFMjvw/oJdtGI+gEhPeeVhJPLUUZFDPH+HlidNyh4I0FYh6ZHVaJAAvmsOW9PmmhiVLRi/WKXxiXEN7HMTxIiJzIfBBoUs43VEZRwAtkbo9f7dNWaVJ3He+dSypCM65Cj3G5DrF4P/+MP6oeJ49Li3lp/1luWvYWUY/N8um/fE+wlSR/ps1jOIJUBxf7Ov3ItAu/cb+JWSsuIwYOLl7neKjKTZIJYeZd3SzCs+TkEUHG/dhH6t7Ix8N98QU5Zb0vLVlcOnb/nIxMjdOi6ktZHFVeSwQfGge048hy9hPybY820DukwstgwtGW5wtnvIXO09wFrfWh3vha3bq8DSl+vJdP+etPqVXBgMoEWejupJXSnpNUbfk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d7a02a-6bd8-4d81-3a46-08ddd43151f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 15:04:05.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfR8q1OrzuNWxWDesNTPVJ5uYD7FnNjltQeKhgQNXYD7DTo0iJXcJ0cApcc41ANaEsQv2v0XBuLSH48/1A6oEW1aiRuJ6QRPDVKh63XWMKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5818
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508050108
X-Proofpoint-ORIG-GUID: NkS7omzyamH9Sasbo97GFmZD1Ca7zbmA
X-Authority-Analysis: v=2.4 cv=HY4UTjE8 c=1 sm=1 tr=0 ts=68921d6d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=vIClCKOAsR4RWIj_v00A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwOSBTYWx0ZWRfX5nxfBMFf7Cfh
 j4vjqoH6ZZ8GI2B/1uhquJPucJSOcBwACcyFsAxNAtIjVuD4vxS9dzn5PYmwAeSqi+gaYhD8zl2
 6dCa2csJauyZN2/QtBAuiLXWjUpTptfEsyqprNtlQWShIUWS2/5g+UNnXvT0eZkLA3DZTs1H9Dn
 JDJ/kS5BFDQfRIPmrBoZowLnA3jQt0kr7jF2aELV5ovU6UVsYUGWEDZo48WoaiP9r4KAgBO2NJN
 SzyOtpfoGvY6Zst82MKq0qFZV1LEmGP1MQQsnoJdXISDDWEkqVE1q0Ym1uHrG1xm+pXmwaAbCNV
 lUZ6g/83mA+I8IxE1QTCaAVTe6BZmRq+JzfCuEmmG19tvxvd9C4GdzkPCj4xapzT8uU4YX4x/x1
 MzSgsWBFd7dL6cJeQTnVzRCYFGa7QhTIgIgfDnUrTzklMFJ1erseKnUzkvYnsUOQz9NrQo0q
X-Proofpoint-GUID: NkS7omzyamH9Sasbo97GFmZD1Ca7zbmA

This patch still does not address the fact that we would like to have probe
argument count and type (if possible) at the probe_info level, which is well
before the trmmpoline is generated.  I'm posting a proposal for an alternative
patch that accomplishes that in a few (still testing).

Also, even without the arg info at probe_info level, this patch still would
unnecessarily set upp->sargc.  Non-stapsdt probes already have that value, and
stapsdt probes do not need the value in your series.

On Wed, Jul 30, 2025 at 10:01:42AM +0100, Alan Maguire wrote:
> stapsdt probes do not include an argument count, so the only
> way to count them is to parse the parameter string.  Adjust
> copy_args() to set upp->sargc while parsing upp->sargv.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 8e7aa4b0..b974e94b 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1153,9 +1153,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  }
>  
>  /*
> - * Generate code that populates the probe arguments.
> + * Generate code that populates, counts the probe arguments.
>   */
> -static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
> +static void copy_args(dt_pcb_t *pcb, dt_uprobe_t *upp)
>  {
>  	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
> @@ -1166,7 +1166,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
>  
>  	assert(pvp != NULL);
>  
> -	for (i = 0; i < upp->sargc; i++) {
> +	for (i = 0; *p != '\0'; i++) {
>  		int	ssize, disp, len;
>  		char	*reg = NULL;
>  		int64_t	val = 0;
> @@ -1433,6 +1433,7 @@ static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
>  			usdt_error(pcb, "Unknown format in arg%d spec", i);
>  #endif
>  	}
> +	upp->sargc = i;
>  }
>  
>  /*
> @@ -1453,7 +1454,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
>  	const dt_probe_t	*uprp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = uprp->prv_data;
> +	dt_uprobe_t		*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
> @@ -1527,7 +1528,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	if (upp->flags & PP_IS_RETURN)
>  		goto out;
>  
> -	if (upp->sargc)
> +	if (upp->sargv)
>  		copy_args(pcb, upp);
>  	else
>  		dt_cg_tramp_copy_args_from_regs(pcb, 0);
> -- 
> 2.43.5
> 
