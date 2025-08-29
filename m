Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE9A30CD95
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493201; cv=fail; b=YPCCB5Y9xi+hc0L2tBOAeY6QjbfYRuyBqe/U7mfgAhhAUYaAbBgVXvyDpXg8o5PWWzNSHOmzlMyOibopmvc6STQG3wr+siwbdEQXY+LvCInBSpnqFBabGboNbgq5qTw5ocHbAvsOELUsFdXXOIQSp38RSSTmsSU2LRK4xNOqQMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493201; c=relaxed/simple;
	bh=iuUUdF076mRcWlPMKFCHNu+IB0rp3G1niZnt71i0P5g=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=BS22Kg7O7S5xe5hy4l8bB1ORQ1HyIK7tP31h3iocIWk+7i2ORofXmsh+icKVTOLyQvL4zPKKxvx4vkIyeuVw9BWbxpx0+HvEBuqx+qGQOwYahMZXpYy99e2xOgbOhPLn0tXppljCYWcyoRRk638wfL/53B41j7dcm5bRKPwSVjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L0N7zKk8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OShJ3Jps; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L0N7zKk8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OShJ3Jps"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGg1j5024023
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=gvzq2KdfeEwJB1/mYRmsvlu5cN0c4tZtF0chQV0ZgtM=; b=
	L0N7zKk803ojeVRLkVbFpGoJkGwcFIIQVGhOyzlAQDUMhgFe36ytkeotBjZXbeF3
	VlNKHoPXu1+ldq8KUh2vWk/aEOFGcQNaNWvcK6nSOMNa1FCGAFfSRXBl6YNaH59Q
	NLqYNJOLY350H70EyeZmToeVbPqdJRu70D2roLguE8o0rgNf9shnVKhUk9H+o84W
	89ffKbPY0eBxltasJfyHKyZEoyNQZW5dov/pEZ/ZOCoijjgpYyZr2h0coIPsVvX0
	OBkgH2m0qXvRYCF6JgqDHvEUVYhGwPVkHGbtcx4IsT6YPlHGhAMXxQYbDT8xySMp
	kC0jImjRnonYo1sb7HlUdw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q42taw6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57THDkpI005064
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43djs05-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkcTrNxYDMRazNOaSQzbN8LkKwFbkwLHsUkbpZt9P+vQUI9ibow2Ykcvwy9FmBL3ZCkSjR+UuHABbkpovXPTe9wNlRBG2IuTVWCpXbazoNRXonuiFwmSPz8Z3yUhnqdVqrCUZikq2Oszf7vIwlNljy4WJeeaAz3CjEi6Gj1b0ab6kNQByNbaP3D+qPbPpiCjtSWPzAK+PS3x5HR98kzicG7D5i4dXhNOsMPPA6vnew0ktJ8UVDki2Ka3rEXPD5/QAOgx7A5LOy2xm7V3mQpEZcYLXigtBa35MScfPYsj9qqO3dObtTmVRi7ExmlbW5WxyKPjReqcvjJ90s2QOlD5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvzq2KdfeEwJB1/mYRmsvlu5cN0c4tZtF0chQV0ZgtM=;
 b=h6vjZaI5Fpu+JIlOKSa16ku/wC5iNy0sXyS6LgYgctoWox7/pYSvNEYcvFeE5l63mO/kcQr3TVd6znyiXgg0wqzEzywi3OL28/zZm+h6dCxfKF0OYjs6FCtmv4JvxTztU1LpTfWyLsAisYPs8E4GOmdNnJ91w0SLU3bIfpVLX1ER18MOjoHuWTJOeNaWoDh2hBwnpMvG/cNO+5unh5NSxQxftoJiewOmy6+Vztw8BIsNCfakUpRBQNtBiFWDEDfVcNzXs7lXFDKjjQw86k4Vb7VAFPC02q11sTNQQicaz69fTsxvhGQIxdxRfbGlDGR763+iVsOGGrrOQ9oaotG21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvzq2KdfeEwJB1/mYRmsvlu5cN0c4tZtF0chQV0ZgtM=;
 b=OShJ3Jps3aaSM02uDHhJYfPTwc505DTdXzIa5UTlbigdHgA2CWsFmuzbr9Fjjs7axdU48RNZuCHU81R8VR1mNd9XKz5rtbYo/x2wRyBFXbpJ2wNVw9UvihpWUYkZVkUEm0ZDG4nCLClEvSZeyl65yDv353n2JRLKFK7tqRjKFIM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 18:46:31 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Fri, 29 Aug 2025
 18:46:31 +0000
Date: Fri, 29 Aug 2025 14:46:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] trace: print alloca pointers as actual pointer values
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672B1B0CFC6BA287D97C4C5C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf71325-237a-46b5-e798-08dde72c5f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TNhBcWI8zxyztRbCdoM5XrrxT8HzWNFFnTgwHIN48fWOT0jX3amPTNIlIIhv?=
 =?us-ascii?Q?P/eCr7LgSixjcF5z269km4IFgPRmUSD8YrFpSlyJAIj45/gcqnMfNk+J/+bb?=
 =?us-ascii?Q?Tem/gsbPxYQhVkY2lNk3uqP0+ZPz7r+d5E5b3pEnqzK9qw6iJNd0ltJWmTZV?=
 =?us-ascii?Q?E/+8yELZe9pB9+vlzYqjs4B/ipvKXRubeWplOx/DWiEl9rCtXAqh26nQ5AeV?=
 =?us-ascii?Q?EuA6B+cASc5tUDxuYKKqNXii4cdW/RrvcUtmdZlbvxEnPFjZfQXrYdRc1nWT?=
 =?us-ascii?Q?A5ecXI8ybOxCuIY9eBx3j1ZuKYEobBLAPxrLU9TzDz7+khdctzh2C7kkPe6T?=
 =?us-ascii?Q?ZsVe7mWxoE6QPLGNNN6Y0pc8wV/NAr3CTVsouO48BIEB54SGDO94l7ZZ9W7l?=
 =?us-ascii?Q?bKlKyHX1YwFG1z96R4xGWUpc46UeEhu2zNX9tWGDBFeTYcW4/QOUbxyQ7NDp?=
 =?us-ascii?Q?nyZRWgljIiNJTCergUluJW1m5l5iKiueqb79JpPFUPXBbcqORSXk5b/VE1+L?=
 =?us-ascii?Q?TitJBgEyYn1VGfgl3XNztGlxBrpH18oupuf5Ne6ReNUnumVfKfGrI8v++1sl?=
 =?us-ascii?Q?eNmfzBml7ywpuA1wfO3cQNk1CE+fZU+fc4I2iPVRVn++zcWhHEl6BqaVriU1?=
 =?us-ascii?Q?Ix7RECQwxjN4Lcf5rr/LYZ1ApZAf7iHLzfB1nLuAvVlpVUOOQIjqhSWu1MAe?=
 =?us-ascii?Q?w82Gmdf5pffqBYscA+xIUFeLUOZRQN3ht7IzvVavneJcUMaQlkRIWbuBMamr?=
 =?us-ascii?Q?6bhj3Di0Kqd1Nwn+vau3TEnsfJ2EPmGzchu7+M/dddRWiIpMKMR/XiKsweFw?=
 =?us-ascii?Q?itujw59UAzjfcJHpZlDGnU9WI7Q1Z9BaQ4i1jQ0Hegao5ofPOsrVH/qjx0SI?=
 =?us-ascii?Q?tCb9Ne9K+9QwJD18m66CZBIK5OK9AAs0RWpYtTO94Hlod1UKq/9MSD0ETJ3p?=
 =?us-ascii?Q?FhqEmGvl2k59KFFsr0b60np9GGnmzlydmrE+3SdF5w+R9hyUIIh5KFviGC8g?=
 =?us-ascii?Q?r9/IrsXFpdybx2XnkOsXgynpN6S5ZiSgJg/TmLPFCCC61AHDo3w/Po0X3U0P?=
 =?us-ascii?Q?pZmDCNkH0F28TITrHVou5SpdmFxvc0lnRbkvMPdMwyNSPhv7WkVG2/9TKoBN?=
 =?us-ascii?Q?XLkHRiJiawJ0BYrct0E+qO8+zZQSKDMkddsqlsU9LzlSihRjAWnHyRRM1wxP?=
 =?us-ascii?Q?WssKOYVUfL7QUiY/p6IwcbHMelW5qEhmAYq03zywJjOv8Uj6yd4RS8iinX1Y?=
 =?us-ascii?Q?lRBlfzpfCpvTlaHHvTmXkFr9jVRCW+UcGXw0IMOCUeKefnLTf7BXvHwxVuCk?=
 =?us-ascii?Q?/+wreWD+S7ytomtjc0bYsaB0lGsw56ZywD/Vv1UnYIYeGIlvKvy1ZyZINH9z?=
 =?us-ascii?Q?gTWaDNr4CKpme82llZbMgMvOB3Wg5Jn1gdUQE9etU47df5Vk6KD9OGgLsC37?=
 =?us-ascii?Q?Lez5Sj4EsbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/60cmczjgCemIHAyJ7BeJgDVR9ZuapLl50fBOjt38LlmanBE+qaMr5zqqleM?=
 =?us-ascii?Q?QceP/3Usb254xwPEOffh7WvkzWFHb8CkEtZp2NN1j8ypqOysca3cSbpMzNtI?=
 =?us-ascii?Q?jtj/iUhXWfLFDvNfm9TI37CtHobSKYrMjm5hkCasOBP0bgKzaO+xWnW1nZ9+?=
 =?us-ascii?Q?Ba+BD2bKcZfl0mRIKHv9LBQuv337YAXhEI1jROZc64F7Gepsgf7f8YuYFYNE?=
 =?us-ascii?Q?ythOazzucDoqRKd9ACC5jKVx2L865QbL8aUMiWi61sP6GnOxW0J/3yT6q8hO?=
 =?us-ascii?Q?QYKxY53Xo/PAVN1yDijDZL62VslA5OIX0kZyh0rcWkM48g5nsMan+bgVDw+o?=
 =?us-ascii?Q?iGG8ghKPLFn41aChhA4rM+1Gv/klsXWjePXWkpDGhHAtWzbHlto4QxZdtVC5?=
 =?us-ascii?Q?T8fBoZ/JNhbPMlS+Lj82SirQCEoRfGt3COczDY+q6a70SeZ7MqHX9mfulHk+?=
 =?us-ascii?Q?Fs+8uHsgnyuTPgo8I1oo5/jG5nBq9Mclg+HKnnRkII3gIoORlJEoDtLI8ovM?=
 =?us-ascii?Q?8dsvjsu+i08+fLmRVx9Psc6V4oHaOVGJlX85QGq988AGXowHFt2K4opre8Qe?=
 =?us-ascii?Q?Gx+eVbsoUrsjYFXOqMN/GwKW2ZqeMIzuaUiDZQOjfpMRxj6c/qwgKbvfpyo0?=
 =?us-ascii?Q?mz1HjSCEoO8uQlCakUQVxq+uSNEORUPYvXV/dBI+EL49iZ2SfVSy5WMqWXlu?=
 =?us-ascii?Q?771DIlO69wbmB1Nhb+cKQJhTO5p7J9kS8umWsjCy2NoX5Vm81/RjloUspPQa?=
 =?us-ascii?Q?q8OllC5n5++rlzJYB8fciumvmq++gs82gzYXoMbXZiY2KvvhRF9swAwF8Jfj?=
 =?us-ascii?Q?DB7oh3MGrb2G7m/uRT3SlwFVwHzGLwXoQ7LCpxodhGukmpI2L5uXzf4jVwBJ?=
 =?us-ascii?Q?IrR85oEqhZnxYpI2UFwaL71xqKocs38bui/ucfOunHpE8s6auFyxXznSBcmp?=
 =?us-ascii?Q?bGvchj4o6l/k3EBau7fMSoFbjrDOHIh0xw7AI452SUX61t3CKPCMBwl0ergm?=
 =?us-ascii?Q?AaOKwwF4bnq6sEDzAdqZWqPy3NW1eQ/6O+dY1MtKVzTZdrTpLKm5gUIDMKI6?=
 =?us-ascii?Q?61ZNamYz8bYjG3FCSc4kUGm1YD0Ix4r4i/rkOC75LHm3+U31lXVyNtkaoWaD?=
 =?us-ascii?Q?DXFW9mOnvezQMU2S0B3WpbWcd0aO0VJJNs9BCX5KntS+WNyM1Tmob0+gl+Jw?=
 =?us-ascii?Q?+scx7j7FEbQi/T9oYFOlgCNM/+IUHV4qKIdQgcEmtSVzi6aM2Oz+7IwR9cdd?=
 =?us-ascii?Q?Y46A5+nuJm3Km0lEeNXR3ohk8E42VrP3utr3HyvYTrfjQd7fl0hLm3AlB8rO?=
 =?us-ascii?Q?uWT2qa9PXV69H4ktcVlXD9ekS9Vh7db3S2XeKNOl9QcyEZrHZjZlUa2JLenx?=
 =?us-ascii?Q?xGTlRa/FsS6OufLu8qVJCizDNxXYhZ6va4w0xIuiIeKJVNXVPVKEawt5MKRI?=
 =?us-ascii?Q?VlsHb8s2l6mldkRTZ25J2/44mKIWHmxQEe+msjNWpdi6uFdVZG5JUhmWFsuF?=
 =?us-ascii?Q?QbT54GNnGlOxY56KkQgvOnnKvBNAetRL1O1B3F5YE2mJrIm3LQvcKQ6d7EW+?=
 =?us-ascii?Q?Cs9nv3Xwe7VMopGZKJSYYsHas3+m/McJiNHWdG3+4fd0RQaqXspzJVkOFbGc?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sdZ56Nbqosaxq/5IFsjpUiAIwpjn129GalW2Q09uQvQx3WhtIchuPnNpukfUNQTnpaPnAxA5oQAIE9K3po4FY2Z3y/ZGYIhajp7Tp4+74zLl8ZNGjdJvmH2LhvcEOhc7TRSW9ZN66zkCUeq7srWyl0Hx5EKpqLqQ53gwaoohHq8jfDPAqEIrQy7dZ6v2IoeCZB/FQzavlTB99UDmN4AKsNHZ0fC8LZQnegpEFNYdWZb8W7roJCVX1BL49ux4Kdr6JGPh3JM/1Vkp1K0R6yimUxMli7hxgt4BocsThMM2YsUr1xouNARTq/J/2pZYqZhwOfDMd8DMlELGmLr5xhKOU548Z7X7fscA0o5bkTWeDdEefC/OdCskIgseJQYlsdhSxawa03mZxn6LlZavZheoT7N0RncgYTvQQBhsAueOTLxJdLfL9TEcKQC7a+j23DRM+yGPN8+gL7xphaYgFm3lmSogNBUGfHxQ15oZ4vDanNpqxepOJuF5OLJiRV4rKcdDdnpvCGC3rL9SZPsTRoeBiF9hNmywHp8vxL2AV4wKxcx/tigPqANzW1ptV3WG00tQfhgR7vKWLMFvt6bg9vZJcg6qETaHx4HUviHm0KpGqQk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf71325-237a-46b5-e798-08dde72c5f13
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 18:46:31.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHEFUJrq165uOH6YxKVTNBRo+leV99hWBbVs42mOXvAjNRoC6HiP+LWDeFBFVWajIBCyQrZHQNUrXZZ8FlX/AGNKqq7y3Y+aVULE8P8cJlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=995 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMyBTYWx0ZWRfX9D5Gb064wQw4
 psvxDsjKie2HYryuOTGrumdIdGaZZm9Hzaza0ExLsZxY4Vzqv1QBGBD15dk+4s/MZpcDXesrevA
 wzSRF/CSGGCWEBgiqqliBFjMwb8BiWsbcDZchdASyJT1LFQzpdH3n8qOpS80iUibGnDTTdY7iiA
 EL8enRnMib4eG1GCGtTnubU9O15G4nEPDfFMujXfTf5PoxcQWYtBK953hHtkViNkZp73w5lcNBM
 URCPylvhGyPDJYuO8gAU+X0hpYi57CbeDBMXtN1ldrVU0STDtuTcN+TGCBN3cEvN69ProqmPBGA
 yPiJjZun8Dsl6KnFdl4IHpsMyfHVQYvTAE5jqCHURmz29fyb7xS0/xwsFyzfWOBhVYgcmsKczMx
 1wQuYa8z
X-Proofpoint-ORIG-GUID: yoEWMQ6hKp9iVUqfGlAWDrB8PVCddn1Z
X-Authority-Analysis: v=2.4 cv=RqfFLDmK c=1 sm=1 tr=0 ts=68b1f58e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FNUi82UgFL9c3-i583MA:9
X-Proofpoint-GUID: yoEWMQ6hKp9iVUqfGlAWDrB8PVCddn1Z

Because alloca pointers are stored internally as ofssets into the
scratchmem area, they were printed as small integers.  They are
now printed as actual pointer values into kernel space.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                          | 19 +++++++++--------
 test/unittest/actions/trace/tst.alloca.d   | 24 ++++++++++++++++++++++
 test/unittest/actions/trace/tst.alloca.r   |  1 +
 test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++++++
 4 files changed, 46 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/actions/trace/tst.alloca.d
 create mode 100644 test/unittest/actions/trace/tst.alloca.r
 create mode 100755 test/unittest/actions/trace/tst.alloca.r.p

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index cd9e7f4e9..7af3dd44b 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1687,16 +1687,17 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		align = vtype.dtdt_align;
 
 		/*
-		 * A DEREF of a REF node does not get resolved in dt_cg_node()
-		 * because the ref node already holds the pointer.  But for
-		 * alloca pointers, that will be the offset into scratchmem so
-		 * we still need to turn it into a real pointer here.
+		 * Alloca pointers are stored as an offset into scratchmem, so
+		 * they need to be converted into real pointers before we go on.
+		 * If the alloca pointer is a REF or ref-by-value is requested,
+		 * we need to do bounds checking before turning the alloca
+		 * pointer into a real pointer.
 		 */
-		if (dnp->dn_kind == DT_NODE_OP1 &&
-		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
-		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
-			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
-						  DT_ISIMM, size);
+		if (dnp->dn_flags & DT_NF_ALLOCA) {
+			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF))
+				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
+							  DT_ISIMM, size);
+
 			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
 			not_null = 1;
 		}
diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
new file mode 100644
index 000000000..d2ff5152d
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.d
@@ -0,0 +1,24 @@
+#pragma D option quiet
+
+BEGIN
+{
+	arr = (int *)alloca(5 * sizeof(int));
+	idx = 4;
+	arr[0] = 1;
+	arr[1] = 22;
+	arr[2] = 333;
+	arr[3] = 4444;
+	arr[4] = 55555;
+	trace(arr);
+	trace(" ");
+	trace(*arr);
+	trace(" ");
+	trace(arr + 2);
+	trace(" ");
+	trace(*(arr + 2));
+	trace(" ");
+	trace(arr + idx);
+	trace(" ");
+	trace(*(arr + idx));
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
new file mode 100644
index 000000000..e9bbf2f5d
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r
@@ -0,0 +1 @@
+OK 1 OK 333 OK 55555
diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
new file mode 100755
index 000000000..8515861ad
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r.p
@@ -0,0 +1,11 @@
+#!/usr/bin/gawk -f
+
+{
+	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
+	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
+	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
+}
+
+{
+	print;
+}
-- 
2.45.2

