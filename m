Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E02064E0
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860542; cv=fail; b=hA/QeY9Fs9CoSl+vw1v6V1+HL2N+YgGd6k9DZ+rChRjMfQsD0fz2Vbc+QDvga6kdZiXX0lecRAcIbvvoNJ0bYCdMs347wK6pz2O7YKPppgmplOCOXeqrgiXc3zB1Av4YnonlU5zGOp8q/28W3yOGaBmmqPyqc8X1DXx+0txHC+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860542; c=relaxed/simple;
	bh=xuHphGPfSVfzMitKCY0mgAbnshBYqlzDNkyM4cgQC/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GNPcNH+vOdz/GTNupS33v+k5lANRa7rm5mREl/qnAT8KyTnIra8ho4l6IqG0hvCRQEJVQNzAhmkHMwEOIYZWN9GfHeKfM3N54EmQrIcqUJcJpDJDLc1GQyaK60SItcHljkit1XmeV2K/VvhnZjS1jgWsBfRQhvlpy+Ye9401SN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O9twS/Kz; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tHR/Z7wF reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O9twS/Kz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tHR/Z7wF"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PCU09v032351
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 12:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=xeT9ax4lDTildFIs57pExKjqke1iDKN2MwakpJs3HG0=; b=
	O9twS/KzhwWxzl/RbTJS+DP9meAn6qCe8pI5Hcw4vdYSwXtW3VrDbhSn246gW7YM
	Aq7NLXtAliOfV3ZWV2mUQDrFAIhL1nRvz592Y0XTKGnbf/XbJxc1iFmX1uDiJ9NA
	f9dPaHF8qnStU9P1t1ugGzDqCtyjUGXj/qUM2fmmkZyZkKYEsC06ag5bKd+KgiGs
	8eqAbNlzcxfIXM6yCOSAKK5IkZ/ZPpQ2ZgeRVJpWsljhAq5BMdBB2aNgn4xdt9ib
	L3/xpudWhHfhOO8gxFebVFAhAOHLJJjOhWakeWuJfW1TckuinycrMPIJ1Nsrywcn
	Kf7vMiN3aNvXGpQr8NPOYw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uvv92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 12:48:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBrV1P039190
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 12:48:56 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5prmm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 12:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdZdhgjITAacucNxKj1boxb2yMHGTpcjOOsg3DkY/QIby6B43ctJkj0moqp/I7MvHFieyVH9GaU5RDJLqTO/ovPX5m9zA+8mj4ElkYLPZJN0UcIOVfIHS4T55a3vWMBPv5PZw642DzqTbUK1nvW0o1cZRzgpoyUiIFO6+JeE+Npd75xYMGAGvqBg9Ltjdq2wCtBXWw8XOIWeJwG3HRq7+tjhBmqvF9If4W+EIAT0fK7ImClovF5imR3yqtcENEsVr4kO6QRoJC6rwlEqm9enZ8rZT00m2YZLOFjzhQxPtRsbNBiEp9h/78f0NyTJ0SXXbMEGI+69Z8IjECHBgKe4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCESiPuOfRJsGzQxsq4dNEaY5P3YJ3G8FbOvAZJJq84=;
 b=iY000EQTZ6eoPXeG7ditoYHgqAZN0nBu7IPxynuPEY7/JyQIt9nEjk+6u2tBqW9nhuqjTJrWmAUIISVBuEMJX9iQeb35DIWwdYS1+sd44ZZMxiunv2PiYexBonddJzaZCrEkbENwuk7h1JtEr8AmTA2VxKAiym4nUzxlxnv6G4+U4HONsKzDIjob+6us324uxYsb7Dyvo0tuRi0AhvdpyR0VrTd4T14vKl36jnw35y12ShnVKfbLVYMwbBwKXL4RIIsbX162o/1RWQuLxHTmiehJEMPx/ZGhIJVmxGcalfqRgCFgYfZJsjifMvmJUnj8LLG6YAW/V5LlHWHgXy+Iyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCESiPuOfRJsGzQxsq4dNEaY5P3YJ3G8FbOvAZJJq84=;
 b=tHR/Z7wFHoq24K/v1ru8dhs+v1lXDOYhJWuKa44tams/PxjRk7tr5cPVDzXayAKy2CknpMMOZvtirKvqsWBGcu72QyRW6/0DZ40C5wdAPiAOhJ+0Rr0O79QaEMiLW2LMI8jPofQVENprpKwRtZG+cXeJ9nsycSr56Gc8+XgyHIQ=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA1PR10MB6267.namprd10.prod.outlook.com (2603:10b6:208:3a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 12:48:53 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 12:48:53 +0000
Date: Fri, 25 Oct 2024 08:48:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 11/19] Support USDT wildcard provider descriptions
Message-ID: <ZxuTsbmFPzUmahNJ@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-5-eugene.loh@oracle.com>
 <Zxp4AmW2HB8G0CBd@kvh-deb-bpf.us.oracle.com>
 <2367490a-554f-6bd0-c7cb-9ff3b5480c0d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2367490a-554f-6bd0-c7cb-9ff3b5480c0d@oracle.com>
X-ClientProxiedBy: BL1PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::31) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA1PR10MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eeba58a-33a1-4968-3695-08dcf4f3618e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?pEB5V1ITtKwiWkvmh5OrqWe2C6NmI3CiAISGZDY2O6rX2YaLBhj7x6IQ8j?=
 =?iso-8859-1?Q?f8+Lrh1JB6EQVj+F0ByB7KY5RDE2Vcz0zEt0MCNzN/yCdTqmMLt4O00gxt?=
 =?iso-8859-1?Q?s1mtf9UyZd4bNAw/fz2/xTk8MmBSs20WVa4ev0A/L9u3ivsCXz9M4g8ETU?=
 =?iso-8859-1?Q?zszS+ELbmRFstZ/3W5T6RrCpIUzmE6+Vc4WAYg+8fyhKaxcU7mmNLZTVA1?=
 =?iso-8859-1?Q?/LYmJkHCiakBtJpq8m6fnBw5u5mQ7Z5/VevxwWTnaa3AAx0BKT93T4rnqk?=
 =?iso-8859-1?Q?y2oltGLzW+DJCpAahKNdFDmlBbVesFRKo4MisTJF3UeLrQcRDTvqYDTC1n?=
 =?iso-8859-1?Q?mq+M1L5GRcloTFWIDsyY6BKsxbyH8+yyblY6AGDjJ0RgEhNgKcXOn8mPU6?=
 =?iso-8859-1?Q?dr7h3+c8xGHwm9yFWfkjjz3mX2cEU2gwSY/xLt+RaPnNmgbZJ70i21b4hB?=
 =?iso-8859-1?Q?jYYbJyUpy0eSCcqxvrO3EpwXZh9CzRXmIoCjR3y2m7Vu5t9tP94KNdTxsE?=
 =?iso-8859-1?Q?pyYChSddeUSh1cDsw3ORtgB/IUc+IhmZ+/HXZqISPXuJGEK8NnHFd7wJnS?=
 =?iso-8859-1?Q?bsiFrfRx1j+VdfkCSaZXOiSapVJcVs7vni7gJ3n0d+LNPAff9fIZfbElGb?=
 =?iso-8859-1?Q?Mzn07k0uFo7cZSZ4lRu354e+mRmQanV1uwYhHcdhoesasgwc7UwXOULQvq?=
 =?iso-8859-1?Q?NN2IfYNkpR9ZzBIF0KrH9a29GtqdMqWiMP/u5NFBlSxf5Z9xRnLU33ILKW?=
 =?iso-8859-1?Q?dyvolbKnjkGDLuGgjzQ3L0vze1w/FmClDd8//qBmpEsusDYolonEEGZLEO?=
 =?iso-8859-1?Q?441SA7pSsPyztQC80hLSK4xdLsZiI+xhi4ZEOouvH4jO8o4Y+H9xyIMPnE?=
 =?iso-8859-1?Q?TuLZYhp5D3YAZ+iFSD5i+kBQkqRZedXloY3XmAx3hg5JYmNt1vhaaqXexY?=
 =?iso-8859-1?Q?EFezUI7rgzonB/eCUbduF+Drnp3egDQUNlBJgbNztvVKQ+bPj60gQ43/WK?=
 =?iso-8859-1?Q?Mhs9IlUZW+WKSkj4HaLiflgATsXt7m71l9gBV7pxXM3HPerZkKuNbG6AZh?=
 =?iso-8859-1?Q?yDx2gkpwFt8f4hr61amCD3QeqtnnwR3h0f9C1na1bSne6GPnZYROiiDHdF?=
 =?iso-8859-1?Q?nuR8UuiSpZGfvt9Oi7kWl6UOeFdeCbjH5tj/epRMPFVVuw1NdOf/n6bek6?=
 =?iso-8859-1?Q?UouPtOA4fI3wle0Ylo4Men+qR/E1hFCzo7sflWB9+eo/fjJMHuqR7Df2lg?=
 =?iso-8859-1?Q?4mWGFjyeB/vG3XGRc7WiaCIv8fQYLXxCK1TIptH8vNrN495/82uGxmRPIW?=
 =?iso-8859-1?Q?t/KI947Fybp3vfWytk8SqoFL10IX4jDEAKiWYyTnwNv8EPdRnDGbxEqLeW?=
 =?iso-8859-1?Q?fTrOrlZyhe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?nW+gUawvQCQzEGOWpL88jVmdU4UMzkEdDgRe3Qu08B5F9KKC/P2Oqiiy6l?=
 =?iso-8859-1?Q?TeKw8Hsk7lMm8OvhPP2cg6tUJLjvr05js1tzI/e1KPBJKBNqgfk4jonzqc?=
 =?iso-8859-1?Q?HwL50EjIlCMcubnIAfN3dgg8VGtVgkouU26YvMcQHx45yA9aU/DzfQaBw4?=
 =?iso-8859-1?Q?A62jZa6372uQDrr2pq06qXWYeOk8PlzMXLJq+A9B75Et6WONkIv0B1xFhE?=
 =?iso-8859-1?Q?qrnxpPO6pwSc1KiXSlozVdrAXjRxa2/OGS+Yh3hZ9oAr+2eoruwbOASsxO?=
 =?iso-8859-1?Q?rGUYuiT9xD7DT7xR5IZRukHEO93wQxXCYrTA1xGr+7uBqPBjxNlg0Ko3Pt?=
 =?iso-8859-1?Q?hFHG5kChm/3cbDcFzD/BdXVxhyUzaz1UF1L+GRKy2+hxfS5mplyxwST7NN?=
 =?iso-8859-1?Q?rNos1UMmTWgcs5mAKXZEHLbgsEM/7b2xAI+yBCk9/xcBAPpDN1PYcRA2+z?=
 =?iso-8859-1?Q?HoHpjNgPKyQtCBYH9sEzW0mW5sheCqWR9fIEK1oFE4YpA9HeT2uX/7EAAq?=
 =?iso-8859-1?Q?0OJEgx3kS1Yook3HwSVFDjaJOSlD4PEF8TFCzI/iM9VGVFsQnHH3S98daf?=
 =?iso-8859-1?Q?XHXZgU153FAMn8qbhvkExRn9s/QvoHNN8JNUe3vzp6nOdZx2LYFmMZYc6q?=
 =?iso-8859-1?Q?hKCg3bdwUNEHbWHeSTJKrj6FyKEQtStn3xEOGO20pMPiHWFZ/9EG3Zc+tG?=
 =?iso-8859-1?Q?/2V08Aw1L5gPAEgd/c6JZsGs6kI4povuMJwS7Owd3cJAh0O2HfVRnlzIe8?=
 =?iso-8859-1?Q?wfmJm2M+dqXZd7riWm1ZJ22NoIocJiHR23mktOzvv2c3vJunVKCs9mbnEg?=
 =?iso-8859-1?Q?We3od2kKTbYfyed1jK26xvjtu+nNhp6davMXfu5IKLMcR94yYZ9TEyJrm3?=
 =?iso-8859-1?Q?R6/rbZxfZl0Dnk62EL6gmaNqOA3Ll/KPXvn9SSlxKHQ/I0YbPXei+cgiCD?=
 =?iso-8859-1?Q?JIkOJHrYaQ1Pl4Fz89O/SeKRON2jVkSftjkqT/zeQp6wsZRtkRRbDUxgOA?=
 =?iso-8859-1?Q?xbUTiTPL47Kq9m061MRk98NRLT4RJRG48E/03L0sj3cRllzHM7qLmdl9LD?=
 =?iso-8859-1?Q?6nFDESq9BRONC2ztA/5ZcyWDtyI2az04QfYfH1G+o64v6zkR/rE14gxiUO?=
 =?iso-8859-1?Q?HX3kiVihtEcedybnWcLDf11xxBK7tA7nWiBZF9ON63R1d2HEgOY1jRILe6?=
 =?iso-8859-1?Q?eFbKMgot37X7fCcUYA50bDPMhbU7bSWSrG8321ESxV9NxTTzgsK9IFGVHp?=
 =?iso-8859-1?Q?9LW0mCuxyUUV7K2Ru6VSxbotOoMunar03ctnb2XFC4EIaIKCECi4oMgInu?=
 =?iso-8859-1?Q?GO/7pzAd7eYmhHYRE/oEFEOCCxTkWuMr4xAoHAP2oCq8TQwrr7roJq0Dy8?=
 =?iso-8859-1?Q?bL73m6dFE3nXmhpJ3j7yWDs4pEVLRbszW/9EIl6yo5wXMkdwFAN/4G660t?=
 =?iso-8859-1?Q?JLlMqEAXcRi1KnmyomdDg395OFKihMZz8CjNhlgzu+cP3ArRmgh6qHS4Tp?=
 =?iso-8859-1?Q?lic/BpWYqHQE1DSUZ0F0OpR65x5kiLVGowb+MzQT6UDC5ut9SJxX7LWR0z?=
 =?iso-8859-1?Q?88rxHd6902FQVasfjwEcg6QDtjmnLxjiqqXrkxcMGfzBCFTwj9Xw7SW11m?=
 =?iso-8859-1?Q?5YhMUbViMViOYa8wq40ytBHGndDVaKYMFhI6cKfQlkxJ9pds6yNqJjsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qLnyUXuDhkOa0E1yfEZtU3ljvpG4T5CZPBJkdCx/b/5OcxtqDQbNmw/15h9V0WWWzHpcXnUl9U4YhejJwcZCy+QBs1dGHfPdMsJTKUY+QzPFOd7Kk5pX2+LYui6wWNHH58aGNR5JLDM+Lc9PAwo4Wy+yEsriSgFjMxNiMR5g4Aw9xks1/ckL5ONrozhyz2qirAUMAHVJfUgxuaXsORX0z+F7STUgIBnDCRz0MIXUeURX/68y570x4XjBXGBhl2m38ffe9C7pTDAw4vsJalGraM9R5dp8jMgE/SMtd4I/uLXifWRvl/ZD8YujzQkd3h5yVNUxb9OhujOgp8iPcPvOqyMOFBFSJ2t8dTcLHnY4dYh83t8EClOqCmB+j3gOgDEJbcJg4dBldDZo7tIMO4ZNJfT98qi7egY8vNa3NfdSEx2DwD0XMC+AUV2e4nLGI2V5Cax6DvmitwhyAOlX5z0nEbRpSL/5hrGM6En2WhwJEiAF3NerUtRu/YTjRkVuS8W4A5QDrpammVDohF4Pe4/cjG0uTtRnh+qYFTXxdFK67xgXa5gYMbATfnLJWCd/mfk/R6n9/cGdK3YBHHfy2CFV8vvkVL7bcLr1c7WVcvrb6i4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeba58a-33a1-4968-3695-08dcf4f3618e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 12:48:53.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3oFRrcjAyyB6Qjsdr7NjznIqfHpj5OIdOi18ft+90xphoodh1ndt6NBexpu1Wd2bfjJuwSKOkAOgUNVIC/c1Wova95l3EZ/n8PuQzBDCmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_12,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250099
X-Proofpoint-GUID: guXc8LuPT51qR0m4As_3YF0Xw2I6E9Nd
X-Proofpoint-ORIG-GUID: guXc8LuPT51qR0m4As_3YF0Xw2I6E9Nd

On Fri, Oct 25, 2024 at 01:56:34AM -0400, Eugene Loh wrote:
> On 10/24/24 12:38, Kris Van Hees wrote:
> 
> > On Tue, Sep 24, 2024 at 04:25:52PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > To look for pid probes, whose pid values must be specified explicitly,
> > > we can require that the provider description should end in a digit.
> > > 
> > > For USDT probes, however, there can be wildcard descriptions.  This
> > > includes a blank provider description as well as a description that
> > > ends in an '*'.
> > What about 'test*1234' or 'test*12*' or 'test*1*2*4'?  All should match
> > 'test_prov1234', right?
> 
> Right.  "test*1234" and "test*1*2*4" already end in a digit, so were already
> included.
> "test*12*" ends in an '*' and so is added by the patch.

Err, duh.  I should have seen that - should have had more coffee.

> > > So, in dt_setcontext(), expand the criteria appropriately.  And
> > > modify dt_pid_create_probes() accordingly.
> > > 
> > > This is rudimentary support.  We still need to:
> > > - handle globs in dt_pid_create_probes_module()
> > > - add process monitoring / inotify
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > > index 12104fc21..62482a70f 100644
> > > --- a/libdtrace/dt_cc.c
> > > +++ b/libdtrace/dt_cc.c
> > > @@ -273,8 +273,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > >   	 * On an error, dt_pid_create_probes() will set the error message
> > >   	 * and tag -- we just have to longjmp() out of here.
> > >   	 */
> > > -	if (pdp->prv && pdp->prv[0] &&
> > > -	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
> > > +	if (pdp->prv &&
> > > +	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
> > > +	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
> > >   	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
> > >   	     pvp->pv_flags & DT_PROVIDER_PID) &&
> > >   	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
> > First of all, I am not sure that combining pid and USDT probe handling here
> > by means of dt_pid_create_probes() makes sense under the new scheme.  In fact,
> > dt_pid_create_probes() may no longer be needed because handling them separately
> > seems better.
> > 
> > Then there are two cases:
> > 
> >   - For pid probes, a provider name must have been supplied and it must have a
> >     digit as last character.  So, for pid probes you can keep the original code
> >     aside from replacing dt_pid_create_probes() with dt_pid_create_pid_probes().
> > 
> >   - For USDT probes, there aren't any restrictions, other than the ones already
> >     done in dt_pid_create_usdt_probes().  So, a call to that function should be
> >     done here without any conditional.
> 
> Okay, though I don't really understand the dt_setcontext() logic. E.g., we
> test pdp->prv!=NULL.  If it could be NULL, then we should still check before
> calling dt_pid_create_usdt_probes(). Stuff like that.  But I made your
> suggested change and it passed tests...  so good enough for me.
